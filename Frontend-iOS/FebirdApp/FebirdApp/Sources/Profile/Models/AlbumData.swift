//
//  AlbumData.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/26/24.
//

import Foundation

struct AlbumData: Identifiable {
    let id = UUID()
    let title: String
    let photos: [PhotoData]
}
