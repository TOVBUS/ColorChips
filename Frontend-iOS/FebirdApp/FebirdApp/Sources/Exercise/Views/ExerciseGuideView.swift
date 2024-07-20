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
    var isStarted = false
    
    var body: some View {
        VStack {
            CustomNavigationBar(title: "스모 스쿼트")
            
            if let player = viewModel.player {
                VideoPlayerView(player: player)
                    .frame(height: 200)
                    .cornerRadius(32)
                    .padding(.vertical, 24)
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
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            
            Spacer()
            
            if isStarted {
                CustomButtonView(title: "시작할래요! 😉")
            } else {
                VStack(alignment: .leading) {
                    Text("이 운동에 대해 더 궁금한게 있나요?")
                        .font(.customFont(size: 14, weight: .light))
                        .foregroundStyle(.gray90)
                        .padding(.leading, 24)
                        .offset(y: 22)
                    
                    CustomButtonView(title: "피버 코치에게 질문할래요! 🤔")
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .onAppear {
            viewModel.loadVideo()
        }
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
    ExerciseGuideView()
}
