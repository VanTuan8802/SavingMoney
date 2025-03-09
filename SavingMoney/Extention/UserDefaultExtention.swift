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
    
    var currency: CurrencyModel {
        get {
            if let savedData = data.data(forKey: Datakey.currency.rawValue),
               let decodedCurrency = try? JSONDecoder().decode(CurrencyModel.self, from: savedData) {
                return decodedCurrency
            }
            return CurrencyModel(id:152,
                                 flag: "https://144-202-123-28.nip.io/images/unitedstates.png",
                                 code: "USD",
                                 country: "United States",
                                 symbol: "$")
        }
        
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                data.set(encodedData,
                         forKey: Datakey.currency.rawValue)
            }
        }
    }
    
}
