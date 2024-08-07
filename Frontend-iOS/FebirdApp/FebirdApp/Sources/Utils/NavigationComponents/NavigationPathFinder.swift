//
//  NavigationPathFinder.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import SwiftUI

class NavigationPathFinder<Option: ViewOptions>: ObservableObject {
    @Published var path: [Option] = []
    @Published var isFirstEnteredApp: Bool

    init() {
        isFirstEnteredApp = UserDefaults.standard.bool(forKey: "IsFirstEnteredApp")
    }

    func setIsFirstenteredApp(_ isFirst: Bool) {
        isFirstEnteredApp = isFirst
        UserDefaults.standard.set(isFirst, forKey: "IsFirstEnteredApp")
    }

    func addPath(option: Option) {
        path.append(option)
    }

    func popPath() {
        path.removeLast()
    }

    func popToRoot() {
        path = .init()
    }
}
