//
//  IntroViewModel.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import Foundation

final class IntroViewModel: ObservableObject {
    
    @Published var introSelection: IntroEnum = .intro1
    
    init() {
       
    }
}
