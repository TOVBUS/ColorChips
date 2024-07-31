//
//  ChatBotMainView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct ChatBotMainView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    
    @State private var messages: [Message] = [
        Message(content: "무엇을 도와드릴까요 핑?", isUser: false),
        Message(content: "지금 내가 하고있는 운동은 너무 쉬워. 조금 더 어려운 방법을 추천해줄래?", isUser: true),
        Message(content: "좋아요 핑! 하고싶은 운동 부위 또는 운동할때 고민되는 부분이 있다면 지금 알려주세요 핑!", isUser: false),
        Message(content: "종아리가 점점 두꺼워지고 있어서 고민이야", isUser: true),
        Message(content: "그렇군요! 말씀해주신 내용을 바탕으로 분석하고 알려드릴게요 핑!\n잠시만 기다려주세요 핑!", isUser: false)
    ]
    
    @State private var newMessage = ""
    @State private var mealRecommendation: MealRecommendation?
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    tabViewModel.selectedTab = .meal
                } label: {
                    Image("Chevron-left")
                }
                
                HStack {
                    Spacer()
                    
                    Text("피오코치")
                        .font(.customFont(size: 22, weight: .bold))
                        .foregroundStyle(.gray100)
                        .padding(.trailing, 16)
                    
                    Spacer()
                }
            }
            .padding(16)
            .frame(height: 64)
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(messages) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            //InputFieldView(text: $newMessage, onSend: sendMessage)
            InputFieldView(text: $newMessage, onSend: {})
        }
        .padding(.top, 60)
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .background(ignoresSafeAreaEdges: .bottom)
        .onAppear {
            tabViewModel.isHidden = true
        }
        .onDisappear {
            tabViewModel.isHidden = false
        }
    }
    // MARK: - 메시지 전송 함수
    //    func sendMessage() {
    //        guard !newMessage.isEmpty else { return }
    //        let userMessage = Message(content: newMessage, isUser: true)
    //        messages.append(userMessage)
    //
    //        if newMessage.lowercased().contains("식단") || newMessage.lowercased().contains("추천") {
    //            // API 호출 및 응답 처리
    //            getDietRecommendation()
    //        } else {
    //            // 일반적인 챗봇 응답
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    //                let botResponse = Message(content: "안녕하세요! 무엇을 도와드릴까요?", isUser: false)
    //                messages.append(botResponse)
    //            }
    //        }
    //        newMessage = ""
    //    }
    
    // MARK: - API 호출 함수
    //    func getDietRecommendation() {
    //        // 임의 데이터 실행
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    //            let botResponse = Message(content: "식단 추천을 준비했습니다. 확인해 보세요:", isUser: false)
    //            messages.append(botResponse)
    //
    //            // 더미 데이터
    //            let mealRecommendation = MealRecommendation(meals: ["아침: 오트밀과 과일", "점심: 닭가슴살 샐러드", "저녁: 연어 스테이크와 채소"], calories: 1500)
    //
    //            // 식단 추천 정보를 메시지로 추가
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    //                let recommendationMessage = Message(content: """
    //                        추천 식단:
    //                        \(mealRecommendation.meals.joined(separator: "\n"))
    //
    //                        총 칼로리: \(mealRecommendation.calories)kcal
    //                        """, isUser: false)
    //                messages.append(recommendationMessage)
    //            }
    //        }
    //    }
}

#Preview {
    ChatBotMainView()
}
