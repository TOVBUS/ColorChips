//
//  LoginViewModel.swift
//  FebirdApp
//
//  Created by 김수영 on 8/4/24.
//

import Foundation
import SwiftUI
import Combine

class SocialLoginViewModel: ObservableObject {
    @Published var loginResult: String?
    private var cancellables = Set<AnyCancellable>()

    func loginWithApple(appleID: String) {
        let url = URL(string: "https://app-feo.azurewebsites.net/member/apple-login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["appleID": appleID]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        print("Sending request to \(url) with body: \(body)") // 요청 정보 로깅

        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                print("Received HTTP response: \(httpResponse.statusCode)") // 응답 상태 코드 로깅
                if httpResponse.statusCode != 200 {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)") // 에러 메시지 로깅
                }
            }, receiveValue: { [weak self] response in
                print("Received response: \(response)") // 응답 데이터 로깅
                self?.loginResult = response.token
            })
            .store(in: &cancellables)
    }
}

struct LoginResponse: Decodable {
    let token: String
}
