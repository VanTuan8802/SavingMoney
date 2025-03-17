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
        case language
        case openedLanguage
        case openedIntro
        case openedLogin
        case currency
        case openedCurrency
        case nextView
        case budget
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
        }
    }
    
    var showFirstLanguage: Bool {
        get {
            return data.bool(forKey: Datakey.openedLanguage.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.openedLanguage.rawValue)
        }
    }
    
    var showIntro: Bool {
        get {
            return data.bool(forKey: Datakey.openedIntro.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.openedIntro.rawValue)
        }
    }
    
    var showLogin: Bool {
        get {
            return data.bool(forKey: Datakey.openedLogin.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.openedLogin.rawValue)
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
    
    var openCurrency: Bool {
        get {
            return data.bool(forKey: Datakey.openedCurrency.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.openedCurrency.rawValue)
        }
    }
    
    var nextView: NavigationEnum {
        get {
            if let nextViewRawValue = data.string(forKey: Datakey.nextView.rawValue),
               let nextView = NavigationEnum(rawValue: nextViewRawValue) {
                return nextView
            }
            return .language
        }
        set {
            data.set(newValue.rawValue, forKey: Datakey.nextView.rawValue)
        }
    }
    
    var budgetValue: Double {
        get {
            return data.double(forKey: Datakey.budget.rawValue)
        }
        set {
            data.set(newValue, forKey: Datakey.budget.rawValue)
        }
    }
}
