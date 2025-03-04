//
//  Multilanguage.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 4/3/25.
//

import Foundation

extension _R {
    var l10n: string.localizable {
        R.string.localizable(preferredLanguages: [UserDefaultsData.shared.language.rawValue])
    }
}

