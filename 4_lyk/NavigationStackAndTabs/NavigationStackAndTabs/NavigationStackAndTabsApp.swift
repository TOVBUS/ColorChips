//
//  NavigationStackAndTabsApp.swift
//  NavigationStackAndTabs
//
//  Created by 이유경 on 6/27/24.
//

import SwiftUI

@main
struct NavigationStackAndTabsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationPathFinder.shared)
        }
    }
}
