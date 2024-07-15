//
//  Font+Extension.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/15/24.
//

import SwiftUI

extension Font {
    enum AppFont: String {
        case ibmPlexSansKR = "IBMPlexSansKR"
        case workSans = "WorkSans"
    }
    
    enum AppFontWeight: String {
        case thin, extraLight, light, regular, medium, semiBold, bold, extraBold, black
        
        var uiFont: UIFont.Weight {
            switch self {
            case .thin: return .thin
            case .extraLight: return .ultraLight
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .semiBold: return .semibold
            case .bold: return .bold
            case .extraBold: return .heavy
            case .black: return .black
            }
        }
    }
    
    static func app(_ font: AppFont, size: CGFloat, weight: AppFontWeight = .regular) -> Font {
        let fontName = "\(font.rawValue)-\(weight.rawValue.capitalized)"
        return Font.custom(fontName, size: size)
    }
    
    static func body(english: Bool = false) -> Font {
        app(english ? .workSans : .ibmPlexSansKR, size: 14)
    }
    
    static func bodyBold(english: Bool = false) -> Font {
        app(english ? .workSans : .ibmPlexSansKR, size: 14, weight: .semiBold)
    }
    
    static func label(english: Bool = false) -> Font {
        app(english ? .workSans : .ibmPlexSansKR, size: 12)
    }
    
    static func subheader(english: Bool = false) -> Font {
        app(english ? .workSans : .ibmPlexSansKR, size: 18, weight: .medium)
    }
    
    static func sectionHeader(english: Bool = false) -> Font {
        app(english ? .workSans : .ibmPlexSansKR, size: 30, weight: .medium)
    }
    
    static func header(english: Bool = false) -> Font {
        app(english ? .workSans : .ibmPlexSansKR, size: 36, weight: .medium)
    }
}

extension View {
    func appFont(_ style: Font.TextStyle, english: Bool = false) -> some View {
        AnyView(
            Group {
                switch style {
                case .body:
                    self.font(.body(english: english)).lineSpacing(6)
                case .callout:
                    self.font(.bodyBold(english: english)).lineSpacing(6)
                case .caption:
                    self.font(.label(english: english)).lineSpacing(4)
                case .subheadline:
                    self.font(.subheader(english: english)).lineSpacing(10)
                case .title2:
                    self.font(.sectionHeader(english: english)).lineSpacing(8)
                case .title:
                    self.font(.header(english: english)).lineSpacing(4)
                default:
                    self
                }
            }
        )
    }
}
