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
        "발을 어깨 너비보다 넓게 벌리고, 발끝을 바깥쪽으로 향하게 서세요.",
        "등을 곧게 펴고, 무릎이 발끝을 넘지 않도록 하며 스쿼트 자세를 취하세요.",
        "발뒤꿈치로 밀어 원래 위치로 돌아오세요."
    ]
    
    func loadVideo() {
        guard let url = URL(string: "YOUR_VIDEO_URL_HERE") else { return }
        let player = AVPlayer(url: url)
        self.player = player
        player.play()
    }
}
