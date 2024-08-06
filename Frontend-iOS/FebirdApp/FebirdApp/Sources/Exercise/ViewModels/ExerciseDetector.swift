//
//  ExerciseDetector.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import SwiftUI
import Vision
import AVFoundation

class ExerciseDetector: NSObject, ObservableObject {
    @Published var currentExercise: ExerciseType = .sumoSquat
    @Published var count: Int = 0
    @Published var cameraPermissionStatus: AVAuthorizationStatus = .notDetermined
    @Published var isDetecting: Bool = false
    @Published var currentJoints: [VNHumanBodyPoseObservation.JointName] = []
    @Published var lastObservation: VNHumanBodyPoseObservation?

    var captureSession: AVCaptureSession?
    var videoDataOutput: AVCaptureVideoDataOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?

    private var lastPlayedSound: SystemSoundID?

    var exerciseStateString: String {
        switch currentExercise {
        case .overheadClap:
            return clappingState.rawValue
        case .downwardPunch:
            return downwardPunchState.rawValue
        case .sumoSquat:
            return sumoSquatState.rawValue
        }
    }

    var clappingState: ClappingState = .start
    var downwardPunchState: DownwardPunchState = .standing
    var sumoSquatState: SumoSquatState = .standing

    func resetExerciseState() {
        switch currentExercise {
        case .overheadClap:
            clappingState = .start
        case .downwardPunch:
            downwardPunchState = .standing
        case .sumoSquat:
            sumoSquatState = .standing
        }
    }

    func toggleDetection() {
        isDetecting.toggle()
        if isDetecting {
            startDetecting()
        } else {
            stopDetecting()
        }
    }

    func startDetecting() {
        isDetecting = true
        if captureSession == nil {
            setupCaptureSession()
        }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession?.startRunning()
        }
    }

    func stopDetecting() {
        isDetecting = false
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession?.stopRunning()
        }
    }
}
