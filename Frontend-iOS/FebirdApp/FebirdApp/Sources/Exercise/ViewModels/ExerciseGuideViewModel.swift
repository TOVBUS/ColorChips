//
//  ExerciseGuideViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import AVKit

class ExerciseGuideViewModel: ObservableObject {
    @Published var player: AVPlayer?
    let guideSteps = [
        "발을 어깨 너비로 벌리고 서서, 팔을 몸 옆에 자연스럽게 내려놓습니다.",
        "양팔을 천천히 위로 들어 머리 위에서 손뼉을 칩니다.",
        "팔을 천천히 내리면서 시작 자세로 돌아옵니다."
    ]

    func loadVideo() {
        guard let url = URL(string: "https://strfeo.blob.core.windows.net/exercise-video/466512^Overhead_Clap^Shoulders.mp4") else { return }
        let player = AVPlayer(url: url)
        self.player = player
        player.play()
    }
}
