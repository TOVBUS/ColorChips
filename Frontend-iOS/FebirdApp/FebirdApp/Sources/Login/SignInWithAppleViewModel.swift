//
//  SignInWithAppleViewModel.swift
//  FebirdApp
//
//  Created by 김수영 on 8/6/24.
//

import AuthenticationServices

class SignInWithAppleViewModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    @Published var userIdentifier: String = ""
    @Published var userName: String = ""
    @Published var userEmail: String = ""

    private var continueWithAuthorization: ((ASAuthorization) -> Void)?
    private var continueWithError: ((Error) -> Void)?

    func startSignInWithAppleFlow() async throws {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let result = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<ASAuthorization, Error>) in
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()

            self.continueWithAuthorization = { authorization in
                continuation.resume(returning: authorization)
            }
            self.continueWithError = { error in
                continuation.resume(throwing: error)
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            userIdentifier = appleIDCredential.user
            if let fullName = appleIDCredential.fullName {
                userName = "\(fullName.givenName ?? "") \(fullName.familyName ?? "")"
            }
            userEmail = appleIDCredential.email ?? ""
        }
        continueWithAuthorization?(authorization)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization failed: \(error.localizedDescription)")
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window!
    }
}
