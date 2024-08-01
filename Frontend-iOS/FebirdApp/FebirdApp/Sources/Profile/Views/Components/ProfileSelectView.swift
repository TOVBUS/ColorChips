//
//  ProfileSelectView.swift
//  Test
//
//  Created by 김혜수 on 7/22/24.
//

import SwiftUI

enum ProfileSelect: String {
    case album = "앨범"
    case inbody = "인바디"
    case body = "체형"
}

struct ProfileSelectView: View {
    @State var selectedProfile: ProfileSelect = .album
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray10)
            HStack(spacing: 2, content: {
                ProfileSelectButton(profile: .album, selectedProfile: $selectedProfile)
                ProfileSelectButton(profile: .inbody, selectedProfile: $selectedProfile)
                ProfileSelectButton(profile: .body, selectedProfile: $selectedProfile)
            })
        }.frame(height: 48)
    }
}

struct ProfileSelectButton: View {
    let profile: ProfileSelect
    @Binding var selectedProfile: ProfileSelect

    var body: some View {
        Button(action: {
            selectedProfile = profile
        }, label: {
            Text(profile.rawValue)
                .font(.customFont(size: 14, weight: .bold))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(selectedProfile == profile ? Color.gray100 : Color.gray10)
                )
                .foregroundStyle(selectedProfile == profile ? .white : .black)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedProfile == profile ? Color.gray60 : .clear, lineWidth: 4)
                )
        })
    }
}

#Preview {
    ProfileSelectView().background(Color.black)
}
