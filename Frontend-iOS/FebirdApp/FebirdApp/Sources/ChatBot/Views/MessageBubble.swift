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
            if message.isUser { Spacer() }

            Image(message.isUser ? "" : "BigfaceFeo")
                .resizable()
                .frame(width: 48, height: 48)

            Text(message.content)
                .padding(12)
                .font(.customFont(size: 14, weight: .regular))
                .background(message.isUser ? .gray100 : .gray20)
                .foregroundColor(message.isUser ? .white : .gray80)
                .cornerRadius(24, corners:
                                (message.isUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight] )
                )

            if !message.isUser { Spacer() }
        }
    }
}

#Preview {
    MessageBubble(message: Message(content: "안녕 피오!", isUser: true))
}
