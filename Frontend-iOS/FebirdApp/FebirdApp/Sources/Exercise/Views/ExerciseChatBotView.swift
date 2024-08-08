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
    @FocusState private var isTextFieldFocused: Bool
    @StateObject private var keyboardHandler = KeyboardHandler()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Header
                VStack {
                    HStack {
                        Button {
                            exerciseNavigationPathFinder.popPath()
                            tabViewModel.isHidden = false
                        } label: {
                            Image("Chevron-left")
                        }

                        Spacer()

                        Text("피오코치")
                            .font(.customFont(size: 22, weight: .bold))
                            .foregroundStyle(.gray100)

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 100)
                .frame(height: 164)
                .background(Color.white)
                .zIndex(1) // Ensure header stays on top

                // Chat area
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.messages, id: \.content) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding()
                }
                .padding(.top, 10) // Add some padding to separate from header
                .frame(height: max(0, geometry.size.height - 264 - keyboardHandler.keyboardHeight))

                // Input field
                TextFieldTest(placeholder: "메시지를 입력하세요", text: $inputText, viewModel: viewModel)
                    .focused($isTextFieldFocused)
            }
        }
        .background(Color.white)
        .ignoresSafeArea()
        .onAppear {
            tabViewModel.isHidden = true
        }
        .navigationBarBackButtonHidden()
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
}

#Preview {
    ExerciseChatBotView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<MealViewOptions>())
}
