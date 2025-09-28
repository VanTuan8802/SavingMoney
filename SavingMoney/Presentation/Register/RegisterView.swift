//
//  RegisterView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 6/3/25.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var alertTitle: String = ""
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    @FocusState private var passwordFieldIsFocused: Bool
    @FocusState private var confirmPasswordFieldIsFocused: Bool
    
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    ZStack {
                        Image(R.image.register.name)
                            .resizable()
                            .frame(height: 320)
                            .ignoresSafeArea(edges: .top)
                        
                            Text(R.l10n.createAnAccount)
                                .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 24)
                                .padding(.bottom,100)
                    }
                    .frame(height: 320)
                    .padding(.top,0)
                }
                
                VStack {
                    Spacer().frame(height: 200)
                    VStack {
                        ScrollView {
                            VStack {
                                HStack {
                                    Text(R.l10n.alreadyHaveAnAccount)
                                        .font(.custom(R.file.poppinsRegularTtf.name, size: 12))
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Text(R.l10n.signIn)
                                            .font(.custom(R.file.poppinsRegularTtf.name, size: 12))
                                    })
                                }.frame(maxWidth: .infinity,alignment: .leading)
                  
                                TextField(R.l10n.emailAddress(), text: $email)
                                    .focused($emailFieldIsFocused)
                                    .padding()
                                    .background(Color.colorF6F6F6)
                                    .cornerRadius(10)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .padding(.top, 16)
                                
                                SecureField(R.l10n.password(), text: $password)
                                    .focused($passwordFieldIsFocused)
                                    .padding()
                                    .background(Color.colorF6F6F6)
                                    .cornerRadius(10)
                                    .autocapitalization(.none)
                                    .padding(.top, 16)
                                
                                SecureField(R.l10n.password(), text: $confirmPassword)
                                    .focused($passwordFieldIsFocused)
                                    .padding()
                                    .background(Color.colorF6F6F6)
                                    .cornerRadius(10)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .padding(.top, 16)
                                    .padding(.bottom,16)
                            
                                
                                CustomButton(title: R.l10n.signIn()) {
                                    AuthenService.shared.signUpWithEmailPassword(email: email,
                                                                                 password: password,
                                                                                 confirmPassword: confirmPassword) {  success, errorMessage in
                                        if success {
                                            isLoggedIn = true
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
                                
                                Spacer()
                                    .frame(height: 60)
                                
                                ContinueAsGuest()
                                
                                Spacer()
                            }
                        }
                        .scrollIndicators(.hidden)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 0)
                        .clipped()
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
        }
    }
}

#Preview {
    RegisterView()
}
