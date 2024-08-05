//
//  NetworkManager.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/5/24.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case requestFailed
}

class NetworkManager {
    static func fetch<T: Decodable>(_ url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }

        let task = AF.request(url).serializingDecodable(T.self)
        let response = await task.response

        switch response.result {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

/* MARK: - 사용 예시
class ViewModel: ObservableObject {
    @Published var data: SomeData?
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchData() {
        Task {
            isLoading = true
            do {
                data = try await NetworkManager.fetch("https://api.example.com/data")
            } catch {
                self.error = error
            }
            isLoading = false
        }
    }
}
*/
