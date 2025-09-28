//
//  UserDefaultExtention.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 4/3/25.
//

import Foundation

class UserDefaultsData {
    
    static let shared = UserDefaultsData()
    private let data = UserDefaults.standard
    
    enum Datakey: String {
        case firstLanguage
        case intro
        case currency
        case language
    }
    
    var language: LanguageEnum {
        get {
            guard let language = data.string(forKey: Datakey.language.rawValue) else {
                let defaultLanguage = LanguageEnum.en.rawValue
                data.set(defaultLanguage, forKey: Datakey.language.rawValue)
                return LanguageEnum(rawValue: defaultLanguage) ?? .en
            }
            return LanguageEnum(rawValue: language) ?? .en
        }
        set {
            data.set(newValue.rawValue, forKey: Datakey.language.rawValue)
            data.synchronize()
        }
    }
    
    var showFirstLanguage: Bool {
        get {
            return data.bool(forKey: Datakey.firstLanguage.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.firstLanguage.rawValue)
        }
    }
    
    var showIntro: Bool {
        get {
            return data.bool(forKey: Datakey.intro.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.intro.rawValue)
        }
    }

}
