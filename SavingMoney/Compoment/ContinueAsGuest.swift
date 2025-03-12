//
//  ContinueAsGuest.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/1/25.
//

import SwiftUI

struct ContinueAsGuest: View {
    @State private var navigateToCurrency = false 

    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    AuthenService.shared.signInWithAnonymous { success, error in
                        if success {
                            print("Successfully signed in anonymously!")
                            UserDefaultsData.shared.nextView = .currency
                            navigateToCurrency = true // Kích hoạt điều hướng
                        } else {
                            print("Anonymous sign-in failed: \(error ?? "Unknown error")")
                        }
                    }
                }, label: {
                    Text(R.l10n.countinueAsGuest)
                        .font(.custom(R.file.poppinsRegularTtf.name, size: 12))
                        .foregroundColor(.blue4F)
                        .underline()
                })
                .padding()
            }
            .navigationDestination(isPresented: $navigateToCurrency) {
                BaseCurrencyView().navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    ContinueAsGuest()
}
