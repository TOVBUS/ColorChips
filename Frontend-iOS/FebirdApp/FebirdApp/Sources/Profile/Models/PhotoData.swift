//
//  PhotoData.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import Foundation

struct PhotoData: Identifiable {
    let id = UUID()
    let day: Int
    let imageName: String
}
