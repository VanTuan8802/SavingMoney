//
//  LoginWithGoogle.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/1/25.
//

import Foundation
import SwiftUI

struct LoginWithGoogle: View {
    
    var body: some View {
        VStack {
            HStack {
                Divider()
                    .frame(height: 1)
                    .frame(maxWidth:  .infinity)
                    .background(.color484848)
                    .padding(.trailing,0)
                
                Text(R.l10n.orSignUp)
                    .padding(.horizontal)
                    .font(.custom(R.file.poppinsMediumTtf.name, size: 10))
                    .fixedSize()
                    .foregroundColor(.colorAFAFAF)
                Divider()
                    .frame(height: 1)
                    .frame(maxWidth:  .infinity)
                    .background(.color484848)
                    .padding(.leading, 0)
            }
            .padding(.horizontal, 0)
            .frame(maxWidth: .infinity)
            
            HStack {
                Button(action: {
                    print("Facebook button tapped")
                }) {
                    Image(R.image.facebook.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                }
                
                Button(action: {
                    print("Google button tapped")
                }) {
                    Image(R.image.google.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                }
            }
        }
        .padding(.horizontal, 0)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    LoginWithGoogle()
}

