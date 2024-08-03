//
//  SettingsViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/3/24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var systemNotifications: Bool = false
    @Published var appPushNotifications: Bool = false
    @Published var appleHealthSync: Bool = false

    let appVersion: String = "1.0.0"

    var profileSettingsCell: CellConfiguration {
        CellConfiguration(showDesc: false, showChevron: true, showArrow: false, showToggle: false, showVersion: false, text: "프로필 설정")
    }

    var systemNotificationsCell: CellConfiguration {
        CellConfiguration(showDesc: false, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "시스템 알림", isOn: systemNotifications)
    }

    var appPushNotificationsCell: CellConfiguration {
        CellConfiguration(showDesc: false, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "앱 푸시 알림", isOn: appPushNotifications)
    }

    var versionCell: CellConfiguration {
        CellConfiguration(showDesc: false, showChevron: false, showArrow: false, showToggle: false, showVersion: true, text: "버전")
    }

    var reviewCell: CellConfiguration {
        CellConfiguration(showDesc: false, showChevron: false, showArrow: true, showToggle: false, showVersion: false, text: "리뷰 남기기")
    }

    var termsOfUseCell: CellConfiguration {
        CellConfiguration(showDesc: false, showChevron: true, showArrow: false, showToggle: false, showVersion: false, text: "앱 이용약관")
    }

    var appleHealthSyncCell: CellConfiguration {
        CellConfiguration(showDesc: true, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "애플 헬스 연동", isOn: appleHealthSync)
    }

    func updateToggle(for cellType: String, newValue: Bool) {
        switch cellType {
        case "시스템 알림":
            systemNotifications = newValue
        case "앱 푸시 알림":
            appPushNotifications = newValue
        case "애플 헬스 연동":
            appleHealthSync = newValue
        default:
            break
        }
    }

    func toggleSystemNotifications() {
        systemNotifications.toggle()
    }

    func toggleAppPushNotifications() {
        appPushNotifications.toggle()
    }

    func toggleAppleHealthSync() {
        appleHealthSync.toggle()
    }

    func openProfileSettings() {
        // Implement profile settings navigation
    }

    func openTermsOfUse() {
        // Implement terms of use navigation
    }

    func leaveReview() {
        // Implement review functionality
    }

    func logout() {
        // TODO: 로그아웃 로직 구현
        print("로그아웃 시도")
    }

    func withdrawAccount() {
        // TODO: 회원탈퇴 로직 구현
        print("회원탈퇴 시도")
    }
}
