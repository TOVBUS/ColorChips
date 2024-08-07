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
    @Published var messages: [Message] = []
    @Published var errorMessage: String?

    func sendMessage(content: String) async {
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

            let request = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)

            let response = await request.serializingDecodable(ChatResponse.self).response

            switch response.result {
            case .success(let chatResponse):
                if let message = chatResponse.choices.first?.message {
                    messages.append(message)
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print("Error sending message: \(error)")
            }
    }
}
