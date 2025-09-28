//
//  LanguageStorage.swift
//  LoanTracker
//
//  Created by Tienvv on 14/4/25.
//

class LanguageStorage {

    static let shared = LanguageStorage()

    private enum Key: String {
        case language
    }

    @AppStorage(Key.language, default: .en)
    var language: LanguageEnum
}
