//
//  RegisterViewModel.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordCorfirm: String = ""
    
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var isLoading: Bool = false
    
    func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
    
    func enableRegister() -> Bool {
        return !email.isEmpty && !password.isEmpty && !passwordCorfirm.isEmpty && !isLoading
    }
}
