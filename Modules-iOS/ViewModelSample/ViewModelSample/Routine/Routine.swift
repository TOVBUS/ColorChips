//
//  Routine.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import Foundation

struct Routine: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var exercises: [Exercise]
}
