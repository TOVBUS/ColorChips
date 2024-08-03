//
//  ProfileSelectView.swift
//  Test
//
//  Created by 김혜수 on 7/22/24.
//

import SwiftUI

struct ProfileSelectView: View {
    @EnvironmentObject var profileSelectViewModel: ProfileSelectViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray10)

            HStack(spacing: 2) {
                ProfileSelectButton(profile: .album)
                ProfileSelectButton(profile: .inbody)
                ProfileSelectButton(profile: .eyeBody)
            }
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, 4)
        .frame(height: 48)
    }
}

struct ProfileSelectButton: View {
    let profile: ProfileSelect
    @EnvironmentObject var profileSelectViewModel: ProfileSelectViewModel

    var body: some View {
        Button(action: {
            profileSelectViewModel.mainContentType = profile
        }, label: {
            Text(profile.rawValue)
                .font(.customFont(size: 14, weight: .bold))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(profileSelectViewModel.mainContentType == profile ? Color.gray100 : Color.gray10)
                        .padding(4)
                )
                .foregroundStyle(profileSelectViewModel.mainContentType == profile ? .white : .black)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(profileSelectViewModel.mainContentType == profile ? Color.gray60 : .clear, lineWidth: 4)
                        .padding(4)
                )
        })
    }
}

#Preview {
    ProfileSelectView()
        .background(Color.black)
        .previewLayout(.sizeThatFits)
        .padding()
}
