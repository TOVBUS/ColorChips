//
//  ChatViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI
import Alamofire

@MainActor
class ChatViewModel: ObservableObject {
    static let shared = ChatViewModel()

    @Published var messages: [Message] = []
    @Published var errorMessage: String?

    init() {}

    func sendMessage(content: String) async {
        let userMessage = Message(content: content, role: "user")
        messages.append(userMessage)

        print(messages)

        let url = "\(Config.chatURL)"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "api-key": "\(Config.chatApiKey)"
        ]

        let body: [String: Any] = [
            "messages": [
                ["role": "user", "content": content]
            ]
        ]

        do {
            let request = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)

            let response = try await request.serializingDecodable(ChatResponse.self).response

            switch response.result {
            case .success(let chatResponse):
                if let message = chatResponse.choices.first?.message {
                    messages.append(message)
                }
            case .failure(let error):
                handleError(error)
            }
        } catch {
            handleError(error)
        }
    }

    private func handleError(_ error: Error) {
        if let afError = error as? AFError {
            switch afError {
            case .responseSerializationFailed(let reason):
                if case .decodingFailed(let decodingError) = reason {
                    errorMessage = "Decoding failed: \(decodingError.localizedDescription)"
                } else {
                    errorMessage = "Response serialization failed: \(reason)"
                }
            default:
                errorMessage = afError.localizedDescription
            }
        } else {
            errorMessage = error.localizedDescription
        }
        print("Error sending message: \(errorMessage ?? "Unknown error")")
    }

    func clearMessages() {
        messages.removeAll()
    }
}
