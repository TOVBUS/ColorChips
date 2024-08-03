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
                            Text("\(selectedExercise) - \(exerciseDetector.exerciseStateString)")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(exerciseDetector.count) / \(totalCount)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding(.top, 14)
                    .padding(.horizontal, 20)

                    HStack {
                        Spacer()
                        Button {
                            exerciseDetector.resetExerciseState()
                        } label: {
                            Image("refreshButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .padding(10)
                    }
                    .padding(.trailing, 10)

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
            ZStack {
                Path { path in
                    drawConnections(on: &path, in: geometry)
                }
                .stroke(Color.white, lineWidth: 3)

                ForEach(exerciseDetector.currentJoints, id: \.self) { joint in
                    if let point = try? exerciseDetector.lastObservation?.recognizedPoint(joint) {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 10, height: 10)
                            .position(
                                x: CGFloat(point.x) * geometry.size.width,
                                y: (1-CGFloat(point.y)) * geometry.size.height
                            )
                    }
                }
            }
            .scaleEffect(1.2)
            .offset(y: geometry.size.height * 0.035)
        }
    }

    private func isPointWithinBounds(_ point: CGPoint, in geometry: GeometryProxy) -> Bool {
        return point.x >= 0 && point.x <= geometry.size.width &&
        point.y >= 0 && point.y <= geometry.size.height
    }

    private func drawConnections(on path: inout Path, in geometry: GeometryProxy) {
        let connections: [(VNHumanBodyPoseObservation.JointName, VNHumanBodyPoseObservation.JointName)] = [
            (.leftWrist, .leftElbow),
            (.leftElbow, .leftShoulder),
            (.rightWrist, .rightElbow),
            (.rightElbow, .rightShoulder),
            (.leftAnkle, .leftKnee),
            (.leftKnee, .leftHip),
            (.rightAnkle, .rightKnee),
            (.rightKnee, .rightHip)
        ]

        for (start, end) in connections {
            if exerciseDetector.currentJoints.contains(start) && exerciseDetector.currentJoints.contains(end) {
                guard let startPoint = try? exerciseDetector.lastObservation?.recognizedPoint(start),
                      let endPoint = try? exerciseDetector.lastObservation?.recognizedPoint(end) else {
                    continue
                }

                let startPosition = CGPoint(
                    x: min(max(CGFloat(startPoint.x) * geometry.size.width, 0), geometry.size.width),
                    y: min(max((1 - CGFloat(startPoint.y)) * geometry.size.height, 0), geometry.size.height)
                )
                let endPosition = CGPoint(
                    x: min(max(CGFloat(endPoint.x) * geometry.size.width, 0), geometry.size.width),
                    y: min(max((1 - CGFloat(endPoint.y)) * geometry.size.height, 0), geometry.size.height)
                )

                if isPointWithinBounds(startPosition, in: geometry) && isPointWithinBounds(endPosition, in: geometry) {
                    path.move(to: startPosition)
                    path.addLine(to: endPosition)
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

    private var lastPlayedSound: SystemSoundID?

    var exerciseStateString: String {
        switch currentExercise {
        case "Overhead-Clap":
            return clappingState.rawValue
        case "Downward-Punch":
            return downwardPunchState.rawValue
        case "Sumo_Squat":
            return sumoSquatState.rawValue
        default:
            return "알 수 없음"
        }
    }

    enum ClappingState: String {
        case start = "시작 자세"
        case handsUp = "손 올리기"
        case handsDown = "손 내리기"
    }

    var clappingState: ClappingState = .start

    enum DownwardPunchState: String {
        case standing = "서있기"
        case start = "시작 자세"
        case handsUp = "손 올리기"
        case handsDown = "손 내리기"
        case armsExtended = "팔 뻗기"
    }

    var downwardPunchState: DownwardPunchState = .standing

    enum SumoSquatState: String {
        case standing = "서있기"
        case squatting = "스쿼트중"
    }

    var sumoSquatState: SumoSquatState = .standing
    private var initialHipHeight: CGFloat = 0
    private var initialHipToAnkleDistance: CGFloat = 0

    func resetExerciseState() {
        switch currentExercise {
        case "Overhead-Clap":
            clappingState = .start
        case "Downward-Punch":
            downwardPunchState = .standing
        case "Sumo_Squat":
            sumoSquatState = .standing
        default:
            break
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
        let previousState = exerciseStateString
        let previousCount = count

        switch currentExercise {
        case "Overhead-Clap":
            currentJoints = [.leftWrist, .rightWrist, .leftShoulder, .rightShoulder, .leftElbow, .rightElbow]
            detectOverheadClap(observation)
        case "Downward-Punch":
            currentJoints = [.leftWrist, .leftElbow, .leftShoulder, .rightWrist, .rightElbow, .rightShoulder]
            detectDownwardPunch(observation)
        case "Sumo_Squat":
            currentJoints = [.leftAnkle, .rightAnkle, .leftKnee, .rightKnee, .leftHip, .rightHip]
            detectSumoSquat(observation)
        default:
            break
        }

        if exerciseStateString != previousState {
            AudioServicesPlaySystemSound(1000)
        }

        if count > previousCount {
            AudioServicesPlaySystemSound(1033)
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
