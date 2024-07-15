//
//  Font+Extension.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/15/24.
//

import SwiftUI

extension Font {

    // IBM Plex Sans KR 폰트 패밀리 : 한글
    enum IBMPlexSansKR: String {
        case regular = "IBMPlexSansKR-Regular"
        case thin = "IBMPlexSansKR-Thin"
        case extraLight = "IBMPlexSansKR-ExtraLight"
        case light = "IBMPlexSansKR-Light"
        case medium = "IBMPlexSansKR-Medium"
        case semiBold = "IBMPlexSansKR-SemiBold"
        case bold = "IBMPlexSansKR-Bold"
    }

    // Work Sans 폰트 패밀리 : 영어
    enum WorkSans: String {
        case regular = "WorkSans-Regular"
        case thin = "WorkSans-Thin"
        case extraLight = "WorkSans-ExtraLight"
        case light = "WorkSans-Light"
        case medium = "WorkSans-Medium"
        case semiBold = "WorkSans-SemiBold"
        case bold = "WorkSans-Bold"
        case extraBold = "WorkSans-ExtraBold"
        case black = "WorkSans-Black"
    }

    static func ibmPlexSansKR(_ font: IBMPlexSansKR, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }

    static func workSans(_ font: WorkSans, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
}
