//
//  LoginWithGoogle.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/1/25.
//

import SwiftUI

struct LoginWithFacebookGoogle: View {
    var onCompleted: (() -> Void)?
    var onError: ((String) -> Void)?
    
    var body: some View {
        VStack {
            HStack {
                Divider()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .background(.color484848)
                
                Text(R.l10n.orSignUp)
                    .padding(.horizontal)
                    .font(.regular10)
                    .fixedSize()
                    .foregroundColor(.colorAFAFAF)
                
                Divider()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .background(.color484848)
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Button(
                    action: {
                        onError?("Facebook login chưa được hỗ trợ")
                    },
                    label: {
                        Image(R.image.facebook.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56)
                    })
                
                Button(
                    action: {
                        AuthenService.shared.signInWithGoogle { success, error in
                            if success {
                                onCompleted?()
                            } else {
                                onError?(error ?? "Google login failed")
                            }
                        }
                    }, label: {
                        Image(R.image.google.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56)
                    })
            }
        }
        .frame(maxWidth: .infinity)
    }
}
