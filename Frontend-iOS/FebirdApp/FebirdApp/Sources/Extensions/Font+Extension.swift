//
//  Font+Extension.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/15/24.
//

import SwiftUI

extension Font {
    enum Language {
        case korean
        case english
    }

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

    static func customFont(size: CGFloat, weight: Font.Weight, language: Language = .korean) -> Font {
        switch language {
        case .korean:
            let ibmWeight = ibmWeightMapping(weight)
            return Font.custom(ibmWeight.rawValue, size: size)
        case .english:
            let workWeight = workWeightMapping(weight)
            return Font.custom(workWeight.rawValue, size: size)
        }
    }

    private static func ibmWeightMapping(_ weight: Font.Weight) -> IBMPlexSansKR {
        switch weight {
        case .thin: return .thin
        case .ultraLight, .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semiBold
        case .bold, .heavy, .black: return .bold
        default: return .regular
        }
    }

    private static func workWeightMapping(_ weight: Font.Weight) -> WorkSans {
        switch weight {
        case .thin: return .thin
        case .ultraLight: return .extraLight
        case .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semiBold
        case .bold: return .bold
        case .heavy: return .extraBold
        case .black: return .black
        default: return .regular
        }
    }
}
