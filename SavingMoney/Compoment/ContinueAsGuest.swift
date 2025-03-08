//
//  ContinueAsGuest.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/1/25.
//

import SwiftUI

struct ContinueAsGuest: View {
    var body: some View {
        Button(action: {
            AuthenService.shared.signInWithAnonymous { success, error in
                if success {
                    print("Successfully signed in anonymously!")
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
    }
}

#Preview {
    ContinueAsGuest()
}
