//
//  EyeBodyPhoto.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/4/24.
//

import SwiftUI
import SwiftData

@Model
class EyeBodyPhoto {
    @Attribute(.unique) var date: String
    var frontImageData: Data?
    var backImageData: Data?
    var leftImageData: Data?
    var rightImageData: Data?

    init(date: String, frontImage: UIImage? = nil, backImage: UIImage? = nil, leftImage: UIImage? = nil, rightImage: UIImage? = nil) {
        self.date = date
        self.frontImageData = frontImage?.pngData()
        self.backImageData = backImage?.pngData()
        self.leftImageData = leftImage?.pngData()
        self.rightImageData = rightImage?.pngData()
    }

    var images: [UIImage?] {
        [
            frontImageData.flatMap(UIImage.init(data:)),
            backImageData.flatMap(UIImage.init(data:)),
            leftImageData.flatMap(UIImage.init(data:)),
            rightImageData.flatMap(UIImage.init(data:))
        ]
    }
}
