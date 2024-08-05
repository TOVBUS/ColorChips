//
//  ExerciseDetector+ExerciseDetection.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import Vision
import AVFoundation

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
        case .overheadClap:
            currentJoints = [.leftWrist, .rightWrist, .leftShoulder, .rightShoulder, .leftElbow, .rightElbow]
            detectOverheadClap(observation)
        case .downwardPunch:
            currentJoints = [.leftWrist, .leftElbow, .leftShoulder, .rightWrist, .rightElbow, .rightShoulder]
            detectDownwardPunch(observation)
        case .sumoSquat:
            currentJoints = [.leftAnkle, .rightAnkle, .leftKnee, .rightKnee, .leftHip, .rightHip]
            detectSumoSquat(observation)
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
        case .handsUp: // 손목 높이 허리 높이랑 비슷, leftArmAngle과 rightArmAngle이 100도 보다 작아야 함.
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
        var lastAngle: CGFloat = 180
        let standingAngleThreshold: CGFloat = 160
        let squattingAngleThreshold: CGFloat = 90
        let maxAngleDifference: CGFloat = 20

        guard let leftHip = try? observation.recognizedPoint(.leftHip),
              let rightHip = try? observation.recognizedPoint(.rightHip),
              let leftKnee = try? observation.recognizedPoint(.leftKnee),
              let rightKnee = try? observation.recognizedPoint(.rightKnee),
              let leftAnkle = try? observation.recognizedPoint(.leftAnkle),
              let rightAnkle = try? observation.recognizedPoint(.rightAnkle) else {
            return
        }

        let leftAngle = angleBetweenThreePoints(
            p1: CGPoint(x: leftHip.x, y: leftHip.y),
            p2: CGPoint(x: leftKnee.x, y: leftKnee.y),
            p3: CGPoint(x: leftAnkle.x, y: leftAnkle.y)
        )

        let rightAngle = angleBetweenThreePoints(
            p1: CGPoint(x: rightHip.x, y: rightHip.y),
            p2: CGPoint(x: rightKnee.x, y: rightKnee.y),
            p3: CGPoint(x: rightAnkle.x, y: rightAnkle.y)
        )

        let currentAngle = (leftAngle + rightAngle) / 2

        switch sumoSquatState {
        case .standing:
            if currentAngle < standingAngleThreshold {
                sumoSquatState = .goingDown
            }
        case .goingDown:
            if currentAngle <= squattingAngleThreshold {
                sumoSquatState = .squatting
            }
        case .squatting:
            if currentAngle > squattingAngleThreshold {
                sumoSquatState = .goingUp
            }
        case .goingUp:
            if currentAngle >= standingAngleThreshold {
                sumoSquatState = .standing
                count += 1
            }
        }
        lastAngle = currentAngle
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

    private func angleBetweenThreePoints(p1: CGPoint, p2: CGPoint, p3: CGPoint) -> CGFloat {
        let v1 = CGPoint(x: p1.x - p2.x, y: p1.y - p2.y)
        let v2 = CGPoint(x: p3.x - p2.x, y: p3.y - p2.y)
        let angle = atan2(v2.y, v2.x) - atan2(v1.y, v1.x)
        return abs(angle * 180 / .pi)
    }
}
