//
//  Config.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/7/24.
//

import Foundation

struct Config {
    static var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("BASE_URL not set in plist for this environment")
        }
        return url
    }
}
