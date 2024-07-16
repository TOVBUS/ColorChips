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

    static func customFont(language: Language, size: CGFloat, weight: Font.Weight) -> Font {
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

    static func body(language: Language = .korean) -> Font {
        customFont(language: language, size: 14, weight: .regular)
    }

    static func bodyBold(language: Language = .korean) -> Font {
        customFont(language: language, size: 14, weight: .semibold)
    }

    static func label(language: Language = .korean) -> Font {
        customFont(language: language, size: 12, weight: .regular)
    }

    static func subheader(language: Language = .korean) -> Font {
        customFont(language: language, size: 18, weight: .medium)
    }

    static func sectionHeader(language: Language = .korean) -> Font {
        customFont(language: language, size: 30, weight: .medium)
    }

    static func header(language: Language = .korean) -> Font {
        customFont(language: language, size: 36, weight: .medium)
    }
}

extension View {
    func appFont(_ style: Font.TextStyle, language: Font.Language = .korean) -> some View {
        Group {
            switch style {
            case .body:
                self.font(.body(language: language)).lineSpacing(6)
            case .callout:
                self.font(.bodyBold(language: language)).lineSpacing(6)
            case .caption:
                self.font(.label(language: language)).lineSpacing(4)
            case .subheadline:
                self.font(.subheader(language: language)).lineSpacing(10)
            case .title2:
                self.font(.sectionHeader(language: language)).lineSpacing(8)
            case .title:
                self.font(.header(language: language)).lineSpacing(4)
            default:
                self
            }
        }
    }
}
