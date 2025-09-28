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
        case didStart
        case didFinishIntroduction
        case didSelectedLanguage
    }

    @AppStorage(Key.didStart, default: false)
    var didStart: Bool

    @AppStorage(Key.didFinishIntroduction, default: false)
    var didFinishIntroduction: Bool

    @AppStorage(Key.didSelectedLanguage, default: false)
    var didSetupFirstLanguage: Bool
}
