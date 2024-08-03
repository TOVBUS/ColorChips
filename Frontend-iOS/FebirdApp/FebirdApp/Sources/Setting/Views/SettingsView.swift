//
//  SettingsView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct SettingsView: View {

    @StateObject private var settingsViewModel = SettingsViewModel()
    @EnvironmentObject private var tabViewModel: TabViewModel
    @EnvironmentObject private var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>

    @State var text: String = ""

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                ProfileSettingHeaderView()

                ScrollView {
                    VStack(alignment: .leading) {
                        Text("계정")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundStyle(.gray100)

                        Button {
                            // TODO: 프로필설정뷰
                            settingsViewModel.openProfileSettings()
                        } label: {
                            CustomCell(configuration: settingsViewModel.profileSettingsCell)
                        }
                        .padding(.bottom, 20)

                        Text("알림")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundStyle(.gray100)

                        VStack {
                            CustomCell(configuration: settingsViewModel.systemNotificationsCell)
                                .onTapGesture(perform: settingsViewModel.toggleSystemNotifications)
                            CustomCell(configuration: settingsViewModel.appPushNotificationsCell)
                                .onTapGesture(perform: settingsViewModel.toggleAppPushNotifications)
                        }
                        .padding(.bottom, 20)

                        Text("앱 정보")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundStyle(.gray100)

                        VStack {
                            CustomCell(configuration: settingsViewModel.versionCell)
                            CustomCell(configuration: settingsViewModel.reviewCell)
                                .onTapGesture(perform: settingsViewModel.leaveReview)
                        }
                        .padding(.bottom, 20)

                        Text("개인정보")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundStyle(.gray100)

                        VStack {
                            CustomCell(configuration: settingsViewModel.termsOfUseCell)
                                .onTapGesture(perform: settingsViewModel.openTermsOfUse)
                            CustomCell(configuration: settingsViewModel.appleHealthSyncCell)
                                .onTapGesture(perform: settingsViewModel.toggleAppleHealthSync)
                        }

                        VStack {
                            Button(action: {
                                // TODO: 로그아웃
                                settingsViewModel.logout()
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
                                settingsViewModel.withdrawAccount()
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
            .navigationBarBackButtonHidden()
            .onAppear {
                tabViewModel.isHidden = true
            }
            .onDisappear {
                tabViewModel.isHidden = false
            }
        }
        .environmentObject(settingsViewModel)
    }
}

#Preview {
    SettingsView()
        .environmentObject(TabViewModel())
        .environmentObject(NavigationPathFinder<ProfileViewOptions>())
}
