//
//  LanguageViewModel.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 27/9/25.
//

import Foundation

final class LanguageViewModel: ObservableObject {
    @Published var isFirstLanguage: Bool = true
    @Published var isShowToast: Bool = false

    init(isFirstLanguage: Bool) {
        self.isFirstLanguage = isFirstLanguage
    
    }
}
