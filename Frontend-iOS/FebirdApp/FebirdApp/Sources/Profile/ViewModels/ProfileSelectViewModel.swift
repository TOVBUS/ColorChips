//
//  ProfileSelectViewModel.swift
//  FebirdApp
//
//  Created by doyeonjeong on 8/1/24.
//

import SwiftUI

enum ProfileSelect: String {
    case album = "앨범"
    case inbody = "인바디"
    case eyeBody = "눈바디"
}

class ProfileSelectViewModel: ObservableObject {
    @Published var mainContentType: ProfileSelect = .inbody
}
