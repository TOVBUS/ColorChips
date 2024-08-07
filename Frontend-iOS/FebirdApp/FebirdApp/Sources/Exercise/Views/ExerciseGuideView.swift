//
//  ExerciseGuideView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI
import AVKit

struct ExerciseGuideView: View {
    @StateObject private var viewModel = ExerciseGuideViewModel()
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @Binding var isStarted: Bool

    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Button(action: {
                    navigationPathFinder.popPath()
                    tabViewModel.isHidden = false
                }, label: {
                    Image("Chevron-left")
                        .resizable()
                        .frame(width: 30, height: 30)

                })

                Text(exercises[0].name)
                    .font(.customFont(size: 22, weight: .bold))
                    .lineSpacing(32)
                    .foregroundColor(.gray90)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 30)

            }
            .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32)
            .padding(.top, 70)
            .padding(.horizontal, 20)

            if let player = viewModel.player {
                VideoPlayerView(player: player)
                    .frame(height: 200)
                    .cornerRadius(32)
                    .padding(20)
            } else {
                ProgressView()
                    .frame(height: 200)
            }

            VStack(alignment: .leading) {
                Text("이렇게 운동하세요 🥸")
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundColor(.gray90)
                    .padding(.vertical, 16)

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.guideSteps.indices, id: \.self) { index in
                            ExerciseGuideTextView(makeAttributedText("\(index + 1). \(viewModel.guideSteps[index])"))
                                .foregroundStyle(.gray100)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 25)

            Spacer()

            if isStarted {
                CustomButtonView(title: "시작할래요! 😉") {
                    navigationPathFinder.addPath(option: .exerciseTimerSettingView)
                }
                .padding(.bottom, 20)
            } else {
                VStack(alignment: .leading) {
                    Text("이 운동에 대해 더 궁금한게 있나요?")
                        .font(.customFont(size: 14, weight: .light))
                        .foregroundStyle(.gray90)
                        .padding(.leading, 24)

                    CustomButtonView(title: "피버 코치에게 질문할래요! 🤔") {
                        navigationPathFinder.addPath(option: .exerciseChatBotView)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            Rectangle()
                .foregroundStyle(.white)
        )
        .ignoresSafeArea()
        .onAppear {
            viewModel.loadVideo()
            tabViewModel.isHidden = true
        }
        .navigationBarBackButtonHidden()
    }

    func makeAttributedText(_ text: String) -> AttributedString {
        var attributedString = AttributedString(text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 12
        style.alignment = .left
        style.headIndent = 12
        style.lineBreakMode = .byWordWrapping

        attributedString.mergeAttributes(.init([.paragraphStyle: style]))

        return attributedString
    }
}

#Preview {
    ExerciseGuideView(isStarted: .constant(false))
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ExerciseViewOptions>())

}
