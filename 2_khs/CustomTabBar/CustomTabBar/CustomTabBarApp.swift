//
//  CustomTabBarApp.swift
//  CustomTabBar
//
//  Created by 김혜수 on 6/30/24.
//

import SwiftUI

@main
struct CustomTabBarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationPathFinder.shared)
        }
    }
}
