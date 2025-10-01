//
//  ContinueAsGuest.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/1/25.
//

import SwiftUI

struct ContinueAsGuest: View {
    private var onCompleted: (() -> Void)?
    private var onError: ((String) -> Void)?
    
    init(
        onCompleted: (() -> Void)? = nil,
        onError: ((String) -> Void)? = nil
    ) {
        self.onCompleted = onCompleted
        self.onError = onError
    }
    
    var body: some View {
        Button(
            action: {
                AuthenService.shared.signInWithAnonymous { success, error in
                    if success {
                        onCompleted?()
                    } else {
                        onError?(error ?? "Unknown error")
                    }
                }
            },
            label: {
                Text(R.l10n.countinueAsGuest)
                    .font(.regular12)
                    .foregroundColor(Color.color4F80FC)
                    .underline()
            })
        .frame(height: 24)
    }
}

