//
//  Font+.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import Foundation
import SwiftUI
import RswiftResources

enum FontFamily {
    case regular
    case medium
    case semiBold
    case bold
    
    var font: FontResource {
        switch self {
        case .regular:
            return R.font.poppinsRegular
        case .medium:
            return R.font.poppinsMedium
        case .semiBold:
            return R.font.poppinsSemiBold
        case .bold:
            return R.font.poppinsBold
        }
    }
}

extension Font {
    /// Regular
    static let regular8 = Font.custom(FontFamily.regular.font, size: 8)
    static let regular10 = Font.custom(FontFamily.regular.font, size: 10)
    static let regular12 = Font.custom(FontFamily.regular.font, size: 12)
    static let regular16 = Font.custom(FontFamily.regular.font, size: 16)
    
    /// Medium
    static let medium10 = Font.custom(FontFamily.medium.font, size: 10)
    static let medium12 = Font.custom(FontFamily.medium.font, size: 12)
    static let medium14 = Font.custom(FontFamily.medium.font, size: 14)
    static let medium16 = Font.custom(FontFamily.medium.font, size: 16)
    static let medium18 = Font.custom(FontFamily.medium.font, size: 18)
    static let medium20 = Font.custom(FontFamily.medium.font, size: 20)
    static let medium24 = Font.custom(FontFamily.medium.font, size: 24)
    
    /// SemiBold
    static let semibold10 = Font.custom(FontFamily.semiBold.font, size: 10)
    static let semibold12 = Font.custom(FontFamily.semiBold.font, size: 12)
    static let semibold14 = Font.custom(FontFamily.semiBold.font, size: 14)
    static let semibold16 = Font.custom(FontFamily.semiBold.font, size: 16)
    static let semibold20 = Font.custom(FontFamily.semiBold.font, size: 20)
    static let semibold24 = Font.custom(FontFamily.semiBold.font, size: 24)
    static let semibold32 = Font.custom(FontFamily.semiBold.font, size: 32)
    
    /// Bold
    static let bold12 = Font.custom(FontFamily.bold.font, size: 12)
    
}
