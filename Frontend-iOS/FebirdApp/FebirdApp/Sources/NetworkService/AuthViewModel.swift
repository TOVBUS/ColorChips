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

@MainActor
class AuthViewModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate {
    @Published var loginResult = false
    private let keychainManager = KeychainManager.shared
    private var signInContinuation: CheckedContinuation<String, Error>?

    // 1. Apple 로그인 요청 시작
    func startSignInWithApple() async throws {
        let request = createAppleIDRequest()
        let appleIDToken = try await performAppleSignIn(with: request)
        try await sendAppleTokenToServer(appleIDToken: appleIDToken)
    }

    // Apple ID 요청 생성
    private func createAppleIDRequest() -> ASAuthorizationAppleIDRequest {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]  // 사용자 이름과 이메일 요청
        return request
    }

    // Apple Sign-In 실행
    private func performAppleSignIn(with request: ASAuthorizationAppleIDRequest) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.performRequests()
            self.signInContinuation = continuation
        }
    }

    // 2. Apple 서버로부터 토큰 수신
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let identityToken = appleIDCredential.identityToken,
           let tokenString = String(data: identityToken, encoding: .utf8) {
            signInContinuation?.resume(returning: tokenString)
        } else {
            signInContinuation?.resume(throwing: NSError(domain: "Apple SignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get Apple ID token"]))
        }
    }

    // Apple 로그인 오류 처리
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        signInContinuation?.resume(throwing: error)
    }

    // 3. Apple ID 토큰을 서버로 전송
    private func sendAppleTokenToServer(appleIDToken: String) async throws {
        let url = "\(Config.baseURL)/member/apple-login"
        let parameters: [String: Any] = ["appleID": appleIDToken]

        print("Sending request to URL: \(url)")
        print("With parameters: \(parameters)")

        do {
            let response = try await AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300) // 200-299 범위의 응답만 유효
                .serializingDecodable(LoginResponse.self).value

            handleLoginSuccess(with: response)
        } catch let afError as AFError {
            handleLoginError(afError)

            if let data = afError.underlyingError as? Data, let responseString = String(data: data, encoding: .utf8) {
                print("AFError: \(afError.localizedDescription)")
                print("Server response: \(responseString)")
            }
        } catch {
            handleLoginError(error)
            print("Unexpected error: \(error.localizedDescription)")
        }
    }

    // 로그인 성공 처리
    private func handleLoginSuccess(with response: LoginResponse) {
        self.loginResult = true
        keychainManager.saveToken(response.token)
        keychainManager.saveMemberID(response.memberId)
        print("Login successful. Token: \(response.token), MemberID: \(response.memberId)")
    }

    // 로그인 실패 처리
    private func handleLoginError(_ error: Error) {
        self.loginResult = false
        print("Login failed with error: \(error.localizedDescription)")
    }
}

struct LoginResponse: Decodable {
    let token: String
    let memberId: Int

    enum CodingKeys: String, CodingKey {
        case token
        case memberId = "member_id"
    }
}
