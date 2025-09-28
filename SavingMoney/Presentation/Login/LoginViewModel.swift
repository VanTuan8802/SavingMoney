//
//  LoginViewModel.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var isLoading: Bool = false
    
    func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
    
    func enableSignIn() -> Bool {
        return !email.isEmpty && !password.isEmpty && !isLoading
    }
}
