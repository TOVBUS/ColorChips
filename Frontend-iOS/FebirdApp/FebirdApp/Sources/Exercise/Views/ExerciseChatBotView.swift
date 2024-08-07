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
    @StateObject private var viewModel = ChatViewModel.shared
    @State private var inputText = ""

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
                    ForEach(viewModel.messages, id: \.content) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            InputFieldView(text: $inputText, viewModel: viewModel)
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
        .onAppear {
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
