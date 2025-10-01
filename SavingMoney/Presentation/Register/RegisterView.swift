//
//  RegisterView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 6/3/25.
//

import SwiftUI
import Factory

struct RegisterView: View {
    @StateObject private var viewModel: RegisterViewModel
    @InjectedObject(\.app) internal var app: AppManager
    
    private var onCompleted: (() -> Void)?
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var isConfirmPasswordFocused: Bool
    
    init(onCompleted: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: RegisterViewModel())
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image(R.image.register.name)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Text(R.l10n.createAnAccount)
                    .font(.semibold24)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
                    .padding(.bottom, 100)
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
        HStack {
            Text(R.l10n.alreadyHaveAnAccount)
                .font(.medium12)
                .foregroundColor(.color18181B)
            
            Button {
                app.navi.pop()
            } label: {
                Text(R.l10n.signIn)
                    .font(.medium12)
                    .foregroundStyle(Color.color4F80FC)
            }
        }
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
        .padding(.bottom, 8)
        
        CustomTextField(
            title: R.l10n.confirmPassword(),
            placeHolder: R.l10n.confirmPassword(),
            value: $viewModel.passwordCorfirm,
            isFocused: $isConfirmPasswordFocused,
            isSecure: true
        )
    }
    
    @MainActor @ViewBuilder
    private var actionView: some View {
        CustomButton(
            title: R.l10n.signUp(),
            isEnable: .constant(viewModel.enableRegister()),
            action: {
                AuthenService.shared.signUpWithEmailPassword(
                    email: viewModel.email,
                    password: viewModel.password,
                    confirmPassword: viewModel.passwordCorfirm
                ) { success, errorMessage in
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
        
        Spacer().frame(height: 16)
        
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
    RegisterView()
}
