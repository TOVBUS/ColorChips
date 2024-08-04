//
//  SettingHeaderView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/4/24.
//

import SwiftUI

struct SettingHeaderView: View {

    @EnvironmentObject private var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 120)
                .foregroundStyle(.gray100)
                .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()

            HStack(alignment: .center, spacing: 12) {
                Button(action: {
                    profileNavigationPathFinder.popPath()
                }, label: {
                    Image("backButton")
                })
                Text("설정")
                    .foregroundStyle(.white)
                    .font(.customFont(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .top)
                Spacer()
            }
            .padding(.leading, 26)
            .padding(.trailing, 87)
            .padding(.top, 60)
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    SettingHeaderView()
}
