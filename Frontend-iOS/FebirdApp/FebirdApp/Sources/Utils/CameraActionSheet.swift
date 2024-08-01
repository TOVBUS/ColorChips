//
//  CameraActionSheet.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct CameraActionSheet: ViewModifier {
    @Binding var isPresented: Bool
    var onCameraTap: () -> Void
    var onGalleryTap: () -> Void

    func body(content: Content) -> some View {
        content
            .confirmationDialog("", isPresented: $isPresented, titleVisibility: .hidden) {
                Button("사진 찍기") {
                    onCameraTap()
                }
                Button("불러오기") {
                    onGalleryTap()
                }
                Button("취소", role: .cancel) {
                }
            }
    }
}
