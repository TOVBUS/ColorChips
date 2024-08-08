//
//  MessageBubble.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct MessageBubble: View {
    let message: Message

    var body: some View {
        HStack(alignment: .bottom) {
            if message.role == "user" { Spacer() }

            if message.role != "user" {
                Image("feoFace")
                    .resizable()
                    .frame(width: 48, height: 48)
            }

            Text(message.content)
                .padding(12)
                .font(.customFont(size: 14, weight: .regular))
                .background(message.role == "user" ? .gray100 : .gray20)
                .foregroundColor(message.role == "user" ? .white : .gray80)
                .cornerRadius(24, corners:
                                (message.role == "user" ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight] )
                )

            if message.role != "user" { Spacer() }
        }
    }
}

#Preview {
    MessageBubble(message: Message(content: "안녕 피오!", role: "user"))
}
