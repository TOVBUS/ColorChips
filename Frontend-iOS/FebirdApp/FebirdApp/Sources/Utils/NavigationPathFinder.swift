//
//  NavigationPathFinder.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import SwiftUI

enum ViewOptions: Hashable {}

class NavigationPathFinder: ObservableObject {
    static let shared = NavigationPathFinder()
    private init() { }

    @Published var path: NavigationPath = .init()
    
    func addPath(option: ViewOptions) {
        path.append(option)
    }
    
    func popPath() {
        path.removeLast()
    }

    func popToRoot() {
        path = .init()
    }
}
