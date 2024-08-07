//
//  Config.swift
//  FebirdApp
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

    static var chatURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "CHAT_URL") as? String else {
            fatalError("CHAT_URL not set in plist for this environment")
        }
        return url
    }

    static var chatApiKey: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "CHAT_API_KEY") as? String else {
            fatalError("CHAT_API_KEY not set in plist for this environment")
        }
        return url
    }
    
    static var docURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "DOC_URL") as? String else {
            fatalError("DOC_URL not set in plist for this environment")
        }
        return url
    }
    
    static var docApiKey: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "DOC_API_KEY") as? String else {
            fatalError("DOC_API_KEY not set in plist for this environment")
        }
        return url
    }
}
