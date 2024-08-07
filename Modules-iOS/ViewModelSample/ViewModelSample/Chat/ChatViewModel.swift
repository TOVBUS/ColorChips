//
//  ChatViewModel.swift
//  ViewModelSample
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
        let url = "https://chat-feofit.openai.azure.com/openai/deployments/gpt-4o-mini/chat/completions?api-version=2024-07-01-preview"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "api-key": "a64e1fed3ef44770ad86e3e23563bf75"  // 여기에 실제 API 키를 입력하세요.
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
                self.errorMessage = error.localizedDescription
                print("Error sending message: \(error)")
            }
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error sending message: \(error)")
        }
    }
}
