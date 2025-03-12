//
//  LoginView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 6/3/25.
//

import SwiftUI

struct LoginView: View {
    @State var showSignUpView = false
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var alertTitle: String = ""
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    @FocusState private var passwordFieldIsFocused: Bool
    
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    ZStack {
                        Image(R.image.login.name)
                            .resizable()
                            .frame(height: 320)
                            .ignoresSafeArea(edges: .top)
                        
                        VStack(spacing: 8) {
                            Text(R.l10n.helloWelcomeTo)
                                .font(.custom(R.file.poppinsMediumTtf.name, size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 24)
                            
                            Text(R.l10n.moneyManager)
                                .font(.custom(R.file.poppinsMediumTtf.name, size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 24)
                        }
                        .padding(.leading, 24)
                        .padding(.bottom, 40)
                    }
                    .frame(height: 320)
                    .padding(.top,0)
                }
                
                VStack {
                    Spacer().frame(height: 200)
                    VStack {
                        ScrollView {
                            VStack {
                                Text(R.l10n.welcomeBack)
                                    .font(.custom(R.file.poppinsMediumTtf.name, size: 12))
                                    .foregroundStyle(.black1B)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                TextField(R.l10n.emailAddress(), text: $email)
                                    .focused($emailFieldIsFocused)
                                    .padding()
                                    .background(Color.greyF6)
                                    .cornerRadius(10)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .padding(.top, 16)
                                
                                SecureField(R.l10n.password(), text: $password)
                                    .focused($passwordFieldIsFocused)
                                    .padding()
                                    .background(Color.greyF6)
                                    .cornerRadius(10)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .padding(.top, 16)
                                
                                HStack {
                                    Button(action: {
                                        AuthenService.shared.sendPasswordReset(email: email) { success, errorMessage in
                                            if success {
                                                alertTitle = R.l10n.openEmail()
                                                alertMessage = R.l10n.openEmailToConfirmLink()
                                                showAlert = true
                                            } else {
                                                alertTitle = R.l10n.theEmailAdressIsBadlyFormated()
                                                alertMessage = errorMessage ?? ""
                                                showAlert = true
                                            }
                                        }
                                    }) {
                                        Text(R.l10n.forgotPassword())
                                            .font(.custom(R.file.poppinsRegularTtf.name, size: 13))
                                            .padding()
                                            .foregroundColor(.blue4F)
                                            .fixedSize()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                CustomButton(title: R.l10n.signIn()) {
                                    AuthenService.shared.signInWithEmailPassword(email: email,
                                                                                 password: password) {  success, errorMessage in
                                        if success {
                                            isLoggedIn = true
                                            UserDefaultsData.shared.nextView = .currency
                                        } else {
                                            alertTitle = R.l10n.loginFail()
                                            alertMessage = errorMessage ?? ""
                                            showAlert = true
                                        }
                                    }
                                }
                                .padding(.top, 0)
                                .navigationDestination(isPresented: $isLoggedIn) {
                                    BaseCurrencyView().navigationBarHidden(true)
                                }
                                
                                LoginWithGoogle()
                                    .padding(.top, 24)
                                
                                HStack {
                                    Text(R.l10n.donnotHaveAcount)
                                        .font(.custom(R.file.poppinsRegularTtf.name, size: 12))
                                        .foregroundColor(Color.greyC1)
                                    NavigationLink(destination: RegisterView().navigationBarBackButtonHidden()) {
                                        Text(R.l10n.signUp)
                                            .font(.custom(R.file.poppinsRegularTtf.name, size: 12))
                                    }
                                }
                                
                                Spacer()
                                    .frame(height: 60)
                                
                                ContinueAsGuest()
                                
                                Spacer()
                            }
                            
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 0)
                    .padding(.horizontal, 24)
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 1)
                    )
                }
            }
        }.overlay(
            Group {
                if showAlert {
                    CustomAlert(
                        isPresented: $showAlert,
                        title: alertTitle,
                        message: alertMessage,
                        cancelTitle: "Cancel",
                        okTitle: "OK",
                        okAction: {
                            print("OK tapped")
                        }
                    )
                }
            }
        )
    }
}

#Preview {
    LoginView()
}
