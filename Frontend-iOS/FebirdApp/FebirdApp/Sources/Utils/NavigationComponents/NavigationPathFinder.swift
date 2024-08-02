//
//  NavigationPathFinder.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import SwiftUI

class NavigationPathFinder<Option: ViewOptions>: ObservableObject {
    @Published var path: [Option] = []

    // TODO: UserDefaults 에 저장하는 값을 기반으로 가져와야됨
    @Published var isFirstEnteredApp = true // true로 고쳐야됨

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
