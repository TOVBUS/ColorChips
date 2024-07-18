//
//  CameraActionSheet.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct CameraActionSheet: ViewModifier {
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        content
            .confirmationDialog("", isPresented: $isPresented, titleVisibility: .hidden) {
                Button("사진 찍기") {
                    takePhoto()
                }
                Button("불러오기") {
                    pickImage()
                }
                Button("취소", role: .cancel) {
                }
            }
    }

    private func takePhoto() {
        // 사진 찍기 기능 구현
        print("사진 찍기")
    }

    private func pickImage() {
        // 이미지 불러오기 기능 구현
        print("이미지 불러오기")
    }
}

extension View {
    func cameraActionSheet(isPresented: Binding<Bool>) -> some View {
        self.modifier(CameraActionSheet(isPresented: isPresented))
    }
}
