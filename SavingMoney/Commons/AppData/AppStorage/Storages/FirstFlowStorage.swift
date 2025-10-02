//
//  FirstFlowStorage.swift
//  LoanTracker
//
//  Created by Tienvv on 14/4/25.
//

import Foundation
import SwiftUI

class FirstFlowStorage {

    static let shared = FirstFlowStorage()

    private enum Key: String {
        case didSelectedLanguage
        case didFinishIntroduction
        case didFinishPermision
        case didSelectCurrency
        case didFisishLogin
        case didOpenFirstApp
    }
    
    @AppStorage(Key.didSelectedLanguage, default: false)
    var didSetupFirstLanguage: Bool
    
    @AppStorage(Key.didFinishIntroduction, default: false)
    var didFinishIntroduction: Bool
    
    @AppStorage(Key.didFinishPermision, default: false)
    var didFinishPermision: Bool
    
    
    @AppStorage(Key.didSelectCurrency, default: false)
    var didSelectCurrency: Bool
    
    
    @AppStorage(Key.didFisishLogin, default: false)
    var didFisishLogin: Bool
    
    @AppStorage(Key.didOpenFirstApp, default: false)
    var didOpenFirstApp: Bool
}
