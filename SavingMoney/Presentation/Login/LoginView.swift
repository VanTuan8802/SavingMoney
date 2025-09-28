//
//  LoginView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 6/3/25.
//

import SwiftUI
import Factory

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @InjectedObject(\.app) internal var app: AppManager
    
    private var onCompleted: (() -> Void)?
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    init(onCompleted: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: LoginViewModel())
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image(R.image.login.name)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(R.l10n.helloWelcomeTo)
                        .font(.medium16)
                        .foregroundColor(.white)
                    
                    Text(R.l10n.moneyManager)
                        .font(.medium24)
                        .foregroundColor(.white)
                }
                .padding(.leading, 24)
                .padding(.bottom, 80)
            }
            
            Spacer()
        }
        .overlay(alignment: .bottom) {
            VStack(spacing: 16) {
                inputView
                actionView
            }
            .padding(.top, 40)
            .padding(.bottom, 36)
            .padding(.horizontal, 24)
            .background(Color.white)
            .radius(topLeading: 20, topTrailing: 20)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(viewModel.alertTitle),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text(R.l10n.ok()))
            )
        }
        .ignoresSafeArea(.all)
    }
    
    @MainActor @ViewBuilder
    private var inputView: some View {
        Text(R.l10n.welcomeBack)
            .font(.medium12)
            .foregroundStyle(.color18181B)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
        
        CustomTextField(
            title: R.l10n.emailAddress(),
            placeHolder: R.l10n.emailAddress(),
            value: $viewModel.email,
            isFocused: $isEmailFocused
        )
        .padding(.bottom, 8)
        
        CustomTextField(
            title: R.l10n.password(),
            placeHolder: R.l10n.password(),
            value: $viewModel.password,
            isFocused: $isPasswordFocused,
            isSecure: true
        )
    }
    
    @MainActor @ViewBuilder
    private var actionView: some View {
        HStack {
            Button(action: {
                AuthenService.shared.sendPasswordReset(email: viewModel.email) { success, errorMessage in
                    if success {
                        viewModel.showAlert(
                            title: R.l10n.openEmail(),
                            message: R.l10n.openEmailToConfirmLink()
                        )
                    } else {
                        viewModel.showAlert(
                            title: R.l10n.theEmailAdressIsBadlyFormated(),
                            message: errorMessage ?? ""
                        )
                    }
                }
            }) {
                Text(R.l10n.forgotPassword())
                    .font(.medium10)
                    .foregroundColor(Color.color4F80FC)
                    .fixedSize()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        
        CustomButton(
            title: R.l10n.signIn(),
            isEnable: .constant(viewModel.enableSignIn()),
            action: {
                AuthenService.shared.signInWithEmailPassword(
                    email: viewModel.email,
                    password: viewModel.password) { success, errorMessage in
                        if success {
                            onCompleted?()
                        } else {
                            viewModel.showAlert(
                                title: R.l10n.loginFail(),
                                message: errorMessage ?? ""
                            )
                        }
                    }
            }
        )
        .disabled(viewModel.isLoading)
        .padding(.top, 0)
        
        LoginWithFacebookGoogle(
            onCompleted: {
                onCompleted?()
            },
            onError: { message in
                viewModel.showAlert(
                    title: R.l10n.loginFail(),
                    message: message
                )
            }
        )
        .padding(.top, 24)
        
        HStack {
            Text(R.l10n.donnotHaveAcount)
                .font(.medium12)
                .foregroundColor(Color.colorC1C1C1)
            
            Button(
                action: {
                    app.navi.push(.register)
                },
                label: {
                    Text(R.l10n.signUp)
                        .font(.semibold12)
                        .foregroundStyle(Color.color4F80FC)
                })
            
        }
        .padding(.top, 8)
        
        Spacer().frame(height: 60)
        
        ContinueAsGuest(
            onCompleted: {
                onCompleted?()
            },
            onError: { message in
                viewModel.showAlert(
                    title: R.l10n.loginFail(),
                    message: message
                )
            }
        )
    }
}

#Preview {
    LoginView()
}
