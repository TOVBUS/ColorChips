//
//  VideoPlayerView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI
import UIKit
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

#Preview {
    VideoPlayerView(player: AVPlayer())
}
