//
//  JointOverlayView.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import SwiftUI
import Vision

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
