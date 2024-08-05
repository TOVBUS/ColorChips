//
//  AuthViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/5/24.
//

import Foundation
import Alamofire
import AuthenticationServices
import Combine

// 서버 응답을 디코딩하기 위한 구조체
struct AuthResponse: Decodable {
    let token: String
}

// 인증 관련 비즈니스 로직을 처리하는 뷰 모델
class AuthViewModel: NSObject, ObservableObject {
    // 사용자 인증 상태를 나타내는 변수 (true: 인증됨, false: 인증되지 않음)
    @Published var isAuthenticated = false
    // 에러 발생 시 저장하는 변수
    @Published var error: Error?
    
    // Combine 프레임워크의 취소 가능한 객체들을 저장하는 집합
    private var cancellables = Set<AnyCancellable>()
    // API 기본 URL
    private let baseURL: String
    // API 키
    private let apiKey: String

    // 초기화 메서드
    override init() {
        // Info.plist에서 API 관련 정보를 가져옴
        guard let baseURL = Bundle.main.infoDictionary?["API_BASE_URL"] as? String,
              let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            fatalError("Missing API configuration")
        }
        self.baseURL = baseURL
        self.apiKey = apiKey
        
        // NSObject의 초기화 메서드 호출
        super.init()

        // 키체인에서 저장된 토큰을 불러옴
        if let data = KeychainManager.load(service: "AuthService", account: "UserToken"),
           let token = String(data: data, encoding: .utf8) {
            self.isAuthenticated = true
            self.setAuthorizationHeader(token: token)
        }
    }

    // Apple 로그인 프로세스를 시작하는 메서드
    func signInWithApple() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }

    // 로그아웃 메서드
    func signOut() {
        // 키체인에서 토큰 삭제
        KeychainManager.delete(service: "AuthService", account: "UserToken")
        // 헤더에서 인증 정보 제거
        AF.session.configuration.headers["Authorization"] = nil
        isAuthenticated = false
    }

    // 서버에 인증 요청을 보내는 메서드
    private func authenticateWithServer(idToken: String) async throws {
        let url = "\(baseURL)/auth/apple"
        let parameters: [String: String] = ["id_token": idToken]
        
        let task = AF.request(url, method: .post, parameters: parameters, headers: ["Authorization": "Bearer \(apiKey)"])
            .validate()
            .serializingDecodable(AuthResponse.self)
        let response = await task.response
        
        switch response.result {
        case .success(let authResponse):
            // 서버로부터 받은 토큰을 키체인에 저장
            if let data = authResponse.token.data(using: .utf8) {
                KeychainManager.save(data, service: "AuthService", account: "UserToken")
            }
            setAuthorizationHeader(token: authResponse.token)
            await MainActor.run {
                self.isAuthenticated = true
            }
        case .failure(let error):
            throw error
        }
    }

    // 인증 헤더를 설정하는 메서드
    private func setAuthorizationHeader(token: String) {
        AF.session.configuration.headers["Authorization"] = "Bearer \(token)"
    }
}

// Apple 로그인 결과를 처리하는 델리게이트 확장
extension AuthViewModel: ASAuthorizationControllerDelegate {
    // 인증이 성공적으로 완료되었을 때 호출되는 메서드
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let idToken = appleIDCredential.identityToken,
           let idTokenString = String(data: idToken, encoding: .utf8) {
            
            Task {
                do {
                    try await authenticateWithServer(idToken: idTokenString)
                } catch {
                    await MainActor.run {
                        self.error = error
                    }
                }
            }
        }
    }

    // 인증 과정에서 에러가 발생했을 때 호출되는 메서드
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.error = error
    }
}
