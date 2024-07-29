//
//  NavigationPathFinder.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import SwiftUI

class NavigationPathFinder<Option: ViewOptions>: ObservableObject {
    @Published var path: [Option] = []
    
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
