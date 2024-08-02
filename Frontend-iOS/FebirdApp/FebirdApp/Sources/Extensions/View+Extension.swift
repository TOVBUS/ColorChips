//
//  View+Extesion.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import SwiftUI

extension View {
    func cameraActionSheet(isPresented: Binding<Bool>, onCameraTap: @escaping () -> Void, onGalleryTap: @escaping () -> Void) -> some View {
        self.modifier(CameraActionSheet(isPresented: isPresented, onCameraTap: onCameraTap, onGalleryTap: onGalleryTap))
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
