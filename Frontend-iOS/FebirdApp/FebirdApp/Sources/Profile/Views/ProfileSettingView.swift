//
//  ProfileSettingView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ProfileSettingView: View {
    var body: some View {
        VStack {
            ZStack {
                HeaderView()
                Image("profile01")
                    .padding(.top, 121)
                ZStack {
                    // TODO: 아이콘 이미지 삽입
                }
            }
            .ignoresSafeArea()
            Spacer()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 185)
                .foregroundStyle(.gray100)
                .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
            .ignoresSafeArea()

            HStack(alignment: .center, spacing: 12) {
                Image("Back_button")
                Text("프로필 설정")
                    .foregroundStyle(.white)
                    .font(.customFont(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .top)
                Spacer()
            }
            .padding(.top, -55)


        }
    }
}

#Preview {
    ProfileSettingView()
}
