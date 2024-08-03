//
//  ProfileSettingHeaderView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct ProfileSettingHeaderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 120)
                .foregroundStyle(.gray100)
                .cornerRadius(34, corners: [.bottomLeft, .bottomRight])
            .ignoresSafeArea()

            HStack(alignment: .center, spacing: 12) {
                Image("backButton")
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
    ProfileSettingHeaderView()
}
