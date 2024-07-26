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
}
