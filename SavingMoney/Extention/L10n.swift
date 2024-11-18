//
//  L10n.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import Foundation

extension _R {
    var l10n: string.localizable {
        R.string.localizable(preferredLanguages: [UserDefaultsData.shared.language.rawValue])
    }
}
