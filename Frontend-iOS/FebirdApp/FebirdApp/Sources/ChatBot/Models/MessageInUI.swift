//
//  Message.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import Foundation

struct MessageInUI: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}
