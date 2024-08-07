//
//  ChatView.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var inputText: String = ""

    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages, id: \.content) { message in
                    HStack {
                        if message.role == "user" {
                            Spacer()
                            Text(message.content)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.horizontal)
                        } else {
                            Text(message.content)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                }
            }

            HStack {
                TextField("메시지를 입력하세요...", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button("Send") {
                    Task {
                        await viewModel.sendMessage(content: inputText)
                        inputText = ""
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle("Chat with GPT-4o-mini")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ChatView()
}
