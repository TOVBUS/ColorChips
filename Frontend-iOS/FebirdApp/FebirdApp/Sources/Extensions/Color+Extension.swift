//
//  Color+Extension.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/15/24.
//

import SwiftUI

extension Color {
    static let brandPrimary = Color(hex: 0x2563EBFF)
    static let defaultFont = Color(hex: 0x111827FF)
    static let neutralBorder = Color(hex: 0xE5E7EBFF)
    static let white = Color(hex: 0xFFFFFFFF)
    static let defaultBackground = Color(hex: 0xFFFFFFFF)

    struct Brand {
        static let brand50 = Color(hex: 0xEFF6FFFF)
        static let brand100 = Color(hex: 0xDBEAFEFF)
        static let brand200 = Color(hex: 0xBFDBFEFF)
        static let brand300 = Color(hex: 0x93C5FDFF)
        static let brand400 = Color(hex: 0x60A5FAFF)
        static let brand500 = Color(hex: 0x3B82F6FF)
        static let brand600 = Color(hex: 0x2563EBFF)
        static let brand700 = Color(hex: 0x1D4ED8FF)
        static let brand800 = Color(hex: 0x1E40AFFF)
        static let brand900 = Color(hex: 0x1E3A8AFF)
    }

    struct Neutral {
        static let neutral50 = Color(hex: 0xF9FAFBFF)
        static let neutral100 = Color(hex: 0xF3F4F6FF)
        static let neutral200 = Color(hex: 0xE5E7EBFF)
        static let neutral300 = Color(hex: 0xD1D5DBFF)
        static let neutral400 = Color(hex: 0x9CA3AFFF)
        static let neutral500 = Color(hex: 0x6B7280FF)
        static let neutral600 = Color(hex: 0x4B5563FF)
        static let neutral700 = Color(hex: 0x374151FF)
        static let neutral800 = Color(hex: 0x1F2937FF)
        static let neutral900 = Color(hex: 0x111827FF)
    }

    struct Error {
        static let error50 = Color(hex: 0xFEF2F2FF)
        static let error100 = Color(hex: 0xFEE2E2FF)
        static let error200 = Color(hex: 0xFECACAFF)
        static let error300 = Color(hex: 0xFCA5A5FF)
        static let error400 = Color(hex: 0xF87171FF)
        static let error500 = Color(hex: 0xEF4444FF)
        static let error600 = Color(hex: 0xDC2626FF)
        static let error700 = Color(hex: 0xB91C1CFF)
        static let error800 = Color(hex: 0x991B1BFF)
        static let error900 = Color(hex: 0x7F1D1DFF)
    }

    struct Warning {
        static let warning50 = Color(hex: 0xFEFCE8FF)
        static let warning100 = Color(hex: 0xFEF9C3FF)
        static let warning200 = Color(hex: 0xFEF08AFF)
        static let warning300 = Color(hex: 0xFDE047FF)
        static let warning400 = Color(hex: 0xFACC15FF)
        static let warning500 = Color(hex: 0xEAB308FF)
        static let warning600 = Color(hex: 0xCA8A04FF)
        static let warning700 = Color(hex: 0xA16207FF)
        static let warning800 = Color(hex: 0x854D0EFF)
        static let warning900 = Color(hex: 0x713F12FF)
    }

    struct Success {
        static let success50 = Color(hex: 0xF0FDF4FF)
        static let success100 = Color(hex: 0xDCFCE7FF)
        static let success200 = Color(hex: 0xBBF7D0FF)
        static let success300 = Color(hex: 0x86EFACFF)
        static let success400 = Color(hex: 0x4ADE80FF)
        static let success500 = Color(hex: 0x22C55EFF)
        static let success600 = Color(hex: 0x16A34AFF)
        static let success700 = Color(hex: 0x15803DFF)
        static let success800 = Color(hex: 0x166534FF)
        static let success900 = Color(hex: 0x14532DFF)
    }

    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 24) & 0xff) / 255,
            green: Double((hex >> 16) & 0xff) / 255,
            blue: Double((hex >> 8) & 0xff) / 255,
            opacity: alpha
        )
    }
}
