//
//  ExerciseDetector+CameraSetup.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/5/24.
//

import AVFoundation

extension ExerciseDetector {
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

    func setupCaptureSession() {
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
