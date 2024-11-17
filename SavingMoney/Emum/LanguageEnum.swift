//
//  LanguageEnum.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import Foundation

enum LanguageEnum: String, Encodable {
    case en = "en"
    case fr = "fr"
    case hi = "hi"
    case es = "es"
    case pt = "pt"
    
    var getName: String {
        switch self {
        case .en:
            return "English"
        case .es:
            return "Spanish"
        case .hi:
            return "Hindi"
        case .fr:
            return "French"
        case .pt:
            return "Portuguese"
        }
    }
    
    var getImageName: String {
        switch self {
        case .en:
            return R.image.english.name
        case .es:
            return R.image.spanish.name
        case .hi:
            return R.image.hindi.name
        case .fr:
            return R.image.french.name
        case .pt:
            return R.image.portugeese.name
        }
    }
}
