//
//  SettingsView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {

        VStack {
            List {
                Section(header: Text("계정")
                    .padding(.leading, -10)
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundStyle(.gray100)
                ) {
                    Text("계정")
                }

                Section(header: Text("알림")
                    .padding(.leading, -10)
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundStyle(.gray100)
                ) {
                    Text("알림")
                }

                Section(header: Text("앱 정보")
                    .padding(.leading, -10)
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundStyle(.gray100)
                ) {
                    Text("알림")
                }

                Section(header: Text("개인정보")
                    .padding(.leading, -10)
                    .font(.customFont(size: 20, weight: .bold))
                    .foregroundStyle(.gray100)
                ) {
                    Text("알림")
                }
            }
            .listStyle(.plain)

            Button(action: {

            }, label: {
                Text("로그아웃")
                    .padding(16)
                    .frame(width: 343, alignment: .center)
                    .foregroundStyle(.gray70)
                    .background(.gray10)
                    .cornerRadius(20)
            }).padding(10)

            Button(action: {

            }, label: {
                Text("회원탈퇴")
                    .padding(16)
                    .frame(width: 343, alignment: .center)
                    .foregroundStyle(.gray70)
                    .background(.gray10)
                    .cornerRadius(20)
            })
        }
    }
}

#Preview {
    SettingsView()
}
