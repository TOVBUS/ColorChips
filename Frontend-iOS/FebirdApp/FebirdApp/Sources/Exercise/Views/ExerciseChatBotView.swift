//
//  ExerciseChatBotView.swift
//  FebirdApp
//
//  Created by 이유경 on 8/4/24.
//

import SwiftUI

struct ExerciseChatBotView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var exerciseNavigationPathFinder: NavigationPathFinder<ExerciseViewOptions>

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
                    exerciseNavigationPathFinder.popPath()
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
            InputFieldView(text: $newMessage, onSend: {})
        }
        .padding(.top, 60)
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .background(ignoresSafeAreaEdges: .bottom)
        .ignoresSafeArea()
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .onAppear{
            tabViewModel.isHidden = true
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ExerciseChatBotView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<MealViewOptions>())
}
