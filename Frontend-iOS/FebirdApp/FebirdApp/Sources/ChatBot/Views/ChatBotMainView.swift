//
//  ChatBotMainView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct ChatBotMainView: View {
    @State private var messages: [Message] = []
    @State private var newMessage = ""
    @State private var mealRecommendation: MealRecommendation?

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding()
                }
                ZStack {
                    InputFieldView(text: $newMessage, onSend: sendMessage)
                }
                .ignoresSafeArea()
            }
            .navigationTitle("피오코치")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    // MARK: - 메시지 전송 함수
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let userMessage = Message(content: newMessage, isUser: true)
        messages.append(userMessage)

        if newMessage.lowercased().contains("식단") || newMessage.lowercased().contains("추천") {
            // API 호출 및 응답 처리
            getDietRecommendation()
        } else {
            // 일반적인 챗봇 응답
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let botResponse = Message(content: "안녕하세요! 무엇을 도와드릴까요?", isUser: false)
                messages.append(botResponse)
            }
        }
        newMessage = ""
    }
    // MARK: - API 호출 함수
    func getDietRecommendation() {
        // 임의 데이터 실행
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let botResponse = Message(content: "식단 추천을 준비했습니다. 확인해 보세요:", isUser: false)
            messages.append(botResponse)

            // 더미 데이터
            let mealRecommendation = MealRecommendation(meals: ["아침: 오트밀과 과일", "점심: 닭가슴살 샐러드", "저녁: 연어 스테이크와 채소"], calories: 1500)

            // 식단 추천 정보를 메시지로 추가
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let recommendationMessage = Message(content: """
                        추천 식단:
                        \(mealRecommendation.meals.joined(separator: "\n"))

                        총 칼로리: \(mealRecommendation.calories)kcal
                        """, isUser: false)
                messages.append(recommendationMessage)
            }
        }
    }
}

#Preview {
    ChatBotMainView()
}
