//
//  SettingsView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct SettingsView: View {
    @State var text: String = ""

    var body: some View {
        VStack {
            HeaderView()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("계정")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.gray100)
                    Button {
                        // TODO: 프로필설정뷰
                        //                AlbumMainView()
                    } label: {
                        CustomCell(showDesc: false, showChevron: true, showArrow: false, showToggle: false, showVersion: false, text: "프로필 설정")
                            .foregroundStyle(.gray100)
                    }
                    .padding(.bottom, 20)

                    Text("알림")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.gray100)
                    VStack {
                        CustomCell(showDesc: false, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "시스템 알림")
                        CustomCell(showDesc: false, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "앱 푸시 알림")
                    }
                    .padding(.bottom, 20)

                    Text("앱 정보")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.gray100)
                    VStack {
                        CustomCell(showDesc: false, showChevron: false, showArrow: false, showToggle: false, showVersion: true, text: "버전")
                        CustomCell(showDesc: false, showChevron: false, showArrow: true, showToggle: false, showVersion: false, text: "리뷰 남기기")
                    }
                    .padding(.bottom, 20)

                    Text("개인정보")
                        .font(.customFont(size: 20, weight: .bold))
                        .foregroundStyle(.gray100)
                    VStack {
                        CustomCell(showDesc: false, showChevron: true, showArrow: false, showToggle: false, showVersion: false, text: "앱 이용약관")
                        CustomCell(showDesc: true, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "애플 헬스 연동")
                    }

                    VStack {
                        Button(action: {
                            // TODO: 로그아웃
                        }, label: {
                            VStack(alignment: .center) {
                                Text("로그아웃")
                                    .font(.customFont(size: 16, weight: .medium))
                                    .foregroundStyle(.gray60)
                            }
                            .padding(16)
                            .frame(width: 343)
                            .background(.gray10)
                            .cornerRadius(24)
                        })

                        Button(action: {
                            // TODO: 회원탈퇴
                        }, label: {
                            VStack(alignment: .center) {
                                Text("회원탈퇴")
                                    .font(.customFont(size: 16, weight: .medium))
                                    .foregroundStyle(.gray60)
                            }
                            .padding(16)
                            .frame(width: 343)
                            .background(.gray10)
                            .cornerRadius(20)
                        })
                    }.padding(.top, 50)
                }
                .padding(25)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SettingsView()
//    HeaderView()
}
