//
//  ExerciseDetector.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import SwiftUI
import Vision
import AVFoundation

/**
 - Vision: 머신 비전 프레임워크로, 이미지 분석 및 비디오 처리에 사용할 수 있습니다. 이 코드는 사람의 신체 포즈를 인식하는 데 사용됩니다.
 - AVFoundation: 비디오와 오디오 캡처 및 처리를 위한 프레임워크입니다. 카메라 세션을 설정하고 비디오 데이터를 캡처합니다.
 - Combine: @Published 속성을 사용하여 데이터의 변화를 관찰하고, UI와의 바인딩을 쉽게 관리합니다.
 */

class ExerciseDetector: NSObject, ObservableObject {
    @Published var currentExercise: ExerciseType = .overheadClap // 현재 운동 종류
    @Published var count: Int = 0 // 운동 동작 카운트
    @Published var cameraPermissionStatus: AVAuthorizationStatus = .notDetermined // 카메라 권한 상태
    @Published var isDetecting: Bool = false // 현재 동작 인식 여부
    @Published var currentJoints: [VNHumanBodyPoseObservation.JointName] = [] // 현재 인식된 관절 목록
    @Published var lastObservation: VNHumanBodyPoseObservation? // 마지막 관절 관측 결과

    var captureSession: AVCaptureSession? // 비디오 캡처 세션
    var videoDataOutput: AVCaptureVideoDataOutput? // 비디오 데이터 출력
    var previewLayer: AVCaptureVideoPreviewLayer? // 비디오 미리보기 레이어

    private var lastPlayedSound: SystemSoundID? // 마지막으로 재생된 소리의 ID

    var exerciseStateString: String {
        switch currentExercise {
        case .overheadClap:
            return clappingState.rawValue // 현재 운동 상태 문자열 반환
        case .downwardPunch:
            return downwardPunchState.rawValue
        case .sumoSquat:
            return sumoSquatState.rawValue
        }
    }

    var clappingState: ClappingState = .start // 박수 운동 상태
    var downwardPunchState: DownwardPunchState = .standing // 아래로 주먹치기 운동 상태
    var sumoSquatState: SumoSquatState = .standing // 스모 스쿼트 운동 상태

    /// 운동 상태를 초기화하는 메서드
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

    /// 동작 인식을 시작하거나 중지하는 메서드
    func toggleDetection() {
        isDetecting.toggle() // 인식 상태 전환
        if isDetecting {
            startDetecting() // 인식 시작
        } else {
            stopDetecting() // 인식 중지
        }
    }

    /// 동작 인식을 시작하는 메서드
    func startDetecting() {
        isDetecting = true // 인식 상태 설정
        if captureSession == nil {
            setupCaptureSession() // 캡처 세션 설정
        }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession?.startRunning() // 비디오 캡처 세션 시작
        }
    }

    /// 동작 인식을 중지하는 메서드
    func stopDetecting() {
        isDetecting = false // 인식 상태 해제
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession?.stopRunning() // 비디오 캡처 세션 중지
        }
    }
}
