//
//  IntroEnum.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import Foundation

enum IntroEnum: String, Encodable {
    case intro1
    case intro2
    case intro3
    case intro4
    
    var getImageIntro: String {
        switch self {
        case .intro1:
            return R.image.intro1.name
        case .intro2:
            return R.image.intro2.name
        case .intro3:
            return R.image.intro3.name
        case .intro4:
            return R.image.intro4.name
        }
    }
    
    var getTitle: String {
        switch self {
        case .intro1:
            return R.l10n.onboard_title_1()
        case .intro2:
            return R.l10n.onboard_title_2()
        case .intro3:
            return R.l10n.onboard_title_3()
        case .intro4:
            return R.l10n.onboard_title_4()
        }
    }
    
    var getContent: String {
        switch self {
        case .intro1:
            return R.l10n.onboard_content_1()
        case .intro2:
            return R.l10n.onboard_content_2()
        case .intro3:
            return R.l10n.onboard_content_3()
        case .intro4:
            return R.l10n.onboard_content_4()
        }
    }
}
