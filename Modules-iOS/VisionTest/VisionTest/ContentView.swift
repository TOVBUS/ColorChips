//
//  ContentView.swift
//  VisionTest
//
//  Created by 김혜수 on 7/28/24.
//

import SwiftUI
import Vision
import AVFoundation

struct ExerciseTimerSettingView: View {
    @StateObject private var exerciseDetector = ExerciseDetector()
    @State private var selectedExercise: String = "Downward-Punch"
    @State private var totalCount: Int = 10
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: ContentView(exerciseDetector: exerciseDetector, selectedExercise: $selectedExercise, totalCount: $totalCount)) {
                    Text("운동하기")
                }
                .disabled(exerciseDetector.cameraPermissionStatus != .authorized)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("카메라 권한 필요"),
                    message: Text("이 앱은 카메라 접근 권한이 필요합니다. 설정에서 권한을 허용해주세요."),
                    primaryButton: .default(Text("설정으로 이동")) {
                        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(settingsUrl)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .onAppear {
            exerciseDetector.currentExercise = selectedExercise
            exerciseDetector.checkCameraPermission()
        }
        .onChange(of: exerciseDetector.cameraPermissionStatus, { _, newValue in
            if newValue == .denied {
                showAlert = true
            }
        })
    }
}

struct ContentView: View {
    @ObservedObject var exerciseDetector: ExerciseDetector
    @Binding var selectedExercise: String
    @Binding var totalCount: Int
    @State private var showAlert = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 현재 운동 상태 화면에 표시, 운동 상태 초기화, 카메라 방향, 줌 아웃, 점 -> 선으로 연결하기
                ZStack {
                    if let previewLayer = exerciseDetector.previewLayer {
                        CameraPreview(previewLayer: previewLayer)
                    }
                    JointOverlayView(exerciseDetector: exerciseDetector)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(height: 52)
                            .cornerRadius(10)

                        HStack {
                            Spacer()
                            Text("\(exerciseDetector.count) / \(totalCount)")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding(.top, 14)
                    .padding(.horizontal, 20)

                    HStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.black.opacity(0.5))
                                .frame(width: 100, height: 40)

                            Text("\(selectedExercise) | \(exerciseDetector.downwardPunchState)")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 44)
                    .padding(.trailing, 32)

                    Spacer()

                    Button(action: {
                        exerciseDetector.toggleDetection()
                    }) {
                        Text(exerciseDetector.isDetecting ? "포기할래요 😭" : "다시 시작하기")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(minHeight: 56)
                            .background(exerciseDetector.isDetecting ? Color.black : Color.green)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            exerciseDetector.currentExercise = selectedExercise
            exerciseDetector.startDetecting()
        }
        .onDisappear {
            exerciseDetector.stopDetecting()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("카메라 권한 필요"),
                message: Text("이 앱은 카메라 접근 권한이 필요합니다. 설정에서 권한을 허용해주세요."),
                primaryButton: .default(Text("설정으로 이동")) {
                    if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsUrl)
                    }
                },
                secondaryButton: .cancel()
            )
        }
        .onChange(of: exerciseDetector.cameraPermissionStatus) { _, newValue in
            if newValue == .denied {
                showAlert = true
            }
        }
    }
}

struct JointOverlayView: View {
    @ObservedObject var exerciseDetector: ExerciseDetector

    var body: some View {
        GeometryReader { geometry in
            ForEach(exerciseDetector.currentJoints, id: \.self) { joint in
                if let point = try? exerciseDetector.lastObservation?.recognizedPoint(joint) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                        .position(
                            x: CGFloat(point.x) * geometry.size.width,
                            y: (1-CGFloat(point.y)) * geometry.size.height
                        )
                }
            }
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    let previewLayer: AVCaptureVideoPreviewLayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

class ExerciseDetector: NSObject, ObservableObject {
    @Published var currentExercise: String = ""
    @Published var count: Int = 0
    @Published var cameraPermissionStatus: AVAuthorizationStatus = .notDetermined
    @Published var isDetecting: Bool = false
    @Published var currentJoints: [VNHumanBodyPoseObservation.JointName] = []
    @Published var lastObservation: VNHumanBodyPoseObservation?

    private var captureSession: AVCaptureSession?
    private var videoDataOutput: AVCaptureVideoDataOutput?
    private var isInExercisePosition = false
    var previewLayer: AVCaptureVideoPreviewLayer?

    enum ClappingState {
        case start
        case handsUp
        case handsDown
    }

    var clappingState: ClappingState = .start

    enum DownwardPunchState {
        case standing
        case start
        case handsUp
        case handsDown
        case armsExtended
    }

    var downwardPunchState: DownwardPunchState = .standing

    enum SumoSquatState {
        case standing
        case squatting
    }

    var sumoSquatState: SumoSquatState = .standing
    private var initialHipHeight: CGFloat = 0
    private var initialHipToAnkleDistance: CGFloat = 0

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

    func checkCameraPermission() {
        cameraPermissionStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if cameraPermissionStatus == .authorized {
            setupCaptureSession()
        } else if cameraPermissionStatus == .notDetermined {
            requestCameraPermission()
        }
    }

    private func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
            DispatchQueue.main.async {
                self?.cameraPermissionStatus = granted ? .authorized : .denied
                if granted {
                    self?.setupCaptureSession()
                }
            }
        }
    }

    private func setupCaptureSession() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            self.captureSession = AVCaptureSession()
            guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
                print("Failed to get the camera device")
                return
            }

            do {
                let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
                if self.captureSession?.canAddInput(videoDeviceInput) == true {
                    self.captureSession?.addInput(videoDeviceInput)
                }

                self.videoDataOutput = AVCaptureVideoDataOutput()
                self.videoDataOutput?.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))

                if self.captureSession?.canAddOutput(self.videoDataOutput!) == true {
                    self.captureSession?.addOutput(self.videoDataOutput!)
                }

                DispatchQueue.main.async {
                    self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession!)
                    self.previewLayer?.videoGravity = .resizeAspectFill
                    self.objectWillChange.send()
                }

                self.captureSession?.startRunning()
            } catch {
                print("Error setting up camera: \(error.localizedDescription)")
            }
        }
    }
}

extension ExerciseDetector: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard isDetecting, let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        let request = VNDetectHumanBodyPoseRequest(completionHandler: handleBodyPoseRequest)

        do {
            let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .leftMirrored, options: [:])
            try imageRequestHandler.perform([request])
        } catch {
            print("Failed to perform body pose detection: \(error)")
        }
    }

    private func handleBodyPoseRequest(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNHumanBodyPoseObservation] else { return }
        guard let observation = observations.first else { return }

        DispatchQueue.main.async {
            self.lastObservation = observation
            self.processBodyPoseObservation(observation)
        }
    }

    private func processBodyPoseObservation(_ observation: VNHumanBodyPoseObservation) {
        switch currentExercise {
        case "Overhead-Clap":
            currentJoints = [.leftWrist, .rightWrist, .leftShoulder, .rightShoulder, .leftElbow, .rightElbow]
            detectOverheadClap(observation)
        case "Downward-Punch":
            currentJoints = [.leftWrist, .rightWrist, .leftShoulder, .rightShoulder, .leftElbow, .rightElbow]
            detectDownwardPunch(observation)
        case "Sumo_Squat":
            currentJoints = [.leftAnkle, .rightAnkle, .leftKnee, .rightKnee, .leftHip, .rightHip]
            detectSumoSquat(observation)
        default:
            break
        }
    }

    private func detectOverheadClap(_ observation: VNHumanBodyPoseObservation) {
        guard let leftWrist = try? observation.recognizedPoint(.leftWrist),
              let rightWrist = try? observation.recognizedPoint(.rightWrist),
              let leftShoulder = try? observation.recognizedPoint(.leftShoulder),
              let rightShoulder = try? observation.recognizedPoint(.rightShoulder),
              let neck = try? observation.recognizedPoint(.neck) else {
            return
        }

        let wristDistance = distance(from: leftWrist, to: rightWrist)
        let shoulderDistance = distance(from: leftShoulder, to: rightShoulder)
        let averageWristHeight = (leftWrist.y + rightWrist.y) / 2
        let neckHeight = neck.y

        switch clappingState {
        case .start:
            if averageWristHeight > neckHeight + 0.1 && wristDistance < shoulderDistance * 0.5 {
                clappingState = .handsUp
            }
        case .handsUp:
            if averageWristHeight < neckHeight - 0.1 {
                clappingState = .handsDown
            }
        case .handsDown:
            if abs(leftWrist.y - rightWrist.y) < 0.1 && wristDistance > shoulderDistance * 0.8 {
                clappingState = .start
                count += 1
            }
        }
    }

    private func detectDownwardPunch(_ observation: VNHumanBodyPoseObservation) {
        guard let leftWrist = try? observation.recognizedPoint(.leftWrist),
              let rightWrist = try? observation.recognizedPoint(.rightWrist),
              let leftElbow = try? observation.recognizedPoint(.leftElbow),
              let rightElbow = try? observation.recognizedPoint(.rightElbow),
              let leftShoulder = try? observation.recognizedPoint(.leftShoulder),
              let rightShoulder = try? observation.recognizedPoint(.rightShoulder),
              let nose = try? observation.recognizedPoint(.nose)
        else { return }

        let averageWristHeight = (leftWrist.y + rightWrist.y) / 2
        let averageElbowHeight = (leftElbow.y + rightElbow.y) / 2
        let averageShoulderHeight = (leftShoulder.y + rightShoulder.y) / 2

        func areArmsExtended() -> Bool {
            let leftArmAngle = angleBetweenPoints(shoulder: leftShoulder, elbow: leftElbow, wrist: leftWrist)
            let rightArmAngle = angleBetweenPoints(shoulder: rightShoulder, elbow: rightElbow, wrist: rightWrist)
            return leftArmAngle > 2.62 && rightArmAngle > 2.62 // 약 150도 이상
        }

        func areArmsBent() -> Bool {
            let leftArmAngle = angleBetweenPoints(shoulder: leftShoulder, elbow: leftElbow, wrist: leftWrist)
            let rightArmAngle = angleBetweenPoints(shoulder: rightShoulder, elbow: rightElbow, wrist: rightWrist)
            return leftArmAngle < 1.75 && rightArmAngle < 1.75 // 약 100도 미만
        }

        switch downwardPunchState {
        case .standing: // 팔꿈치 높이가 어깨 높이보다 살짝 아래, leftArmAngle과 rightArmAngle이 100도 보다 작아야 함.
            if averageElbowHeight > averageShoulderHeight - 0.05 && areArmsBent() {
                downwardPunchState = .start
            }
        case .start: // 평균 손목 높이가 코보다 높게, leftArmAngle과 rightArmAngle이 100도 보다 작아야 함.
            if averageWristHeight > nose.y && areArmsBent() {
                downwardPunchState = .handsUp
            }
        case .handsUp: //손목 높이 허리 높이랑 비슷, leftArmAngle과 rightArmAngle이 100도 보다 작아야 함.
            if averageWristHeight < averageShoulderHeight - 0.05 && areArmsBent() {
                downwardPunchState = .handsDown
            }
        case .handsDown:
            if areArmsExtended() {
                downwardPunchState = .armsExtended
            }
        case .armsExtended: // 팔꿈치 높이가 어깨 높이보다 살짝 아래, leftArmAngle과 rightArmAngle이 100도 보다 작아야 함.
            if averageElbowHeight > averageShoulderHeight - 0.05 && areArmsBent() {
                downwardPunchState = .start
                count += 1
            }
        }
    }

    private func detectSumoSquat(_ observation: VNHumanBodyPoseObservation) {
        guard let leftHip = try? observation.recognizedPoint(.leftHip),
              let rightHip = try? observation.recognizedPoint(.rightHip),
              let leftKnee = try? observation.recognizedPoint(.leftKnee),
              let rightKnee = try? observation.recognizedPoint(.rightKnee),
              let leftAnkle = try? observation.recognizedPoint(.leftAnkle),
              let rightAnkle = try? observation.recognizedPoint(.rightAnkle) else {
            return
        }

        let averageHipHeight = (leftHip.y + rightHip.y) / 2
        let averageKneeHeight = (leftKnee.y + rightKnee.y) / 2
        let averageAnkleHeight = (leftAnkle.y + rightAnkle.y) / 2

        let currentHipToAnkleDistance = averageHipHeight - averageAnkleHeight

        if initialHipHeight == 0 {
            initialHipHeight = averageHipHeight
            initialHipToAnkleDistance = currentHipToAnkleDistance
        }

        let hipHeightChangeRatio = (initialHipHeight - averageHipHeight) / initialHipToAnkleDistance
        let kneeFlexionRatio = (averageHipHeight - averageKneeHeight) / (averageHipHeight - averageAnkleHeight)

        switch sumoSquatState {
        case .standing:
            if hipHeightChangeRatio > 0.2 && kneeFlexionRatio > 0.4 {
                sumoSquatState = .squatting
            }
        case .squatting:
            if hipHeightChangeRatio < 0.1 && kneeFlexionRatio < 0.3 {
                sumoSquatState = .standing
                count += 1
            }
        }
    }

    private func distance(from point1: VNRecognizedPoint, to point2: VNRecognizedPoint) -> CGFloat {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return sqrt(dx*dx + dy*dy)
    }

    private func angleBetweenPoints(shoulder: VNRecognizedPoint, elbow: VNRecognizedPoint, wrist: VNRecognizedPoint) -> CGFloat {
        let v1 = CGPoint(x: elbow.x - shoulder.x, y: elbow.y - shoulder.y)
        let v2 = CGPoint(x: wrist.x - elbow.x, y: wrist.y - elbow.y)
        return abs(atan2(v2.y, v2.x) - atan2(v1.y, v1.x))
    }
}

#Preview {
    ExerciseTimerSettingView()
}