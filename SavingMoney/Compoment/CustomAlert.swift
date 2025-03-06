//
//  CustomAlert.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 21/1/25.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var isPresented: Bool
    var title: String?
    var message: String
    var cancelTitle: String
    var okTitle: String
    var okAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            if let title = title {
                Text(title)
                    .font(.headline)
            }
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
            
            HStack {
                Button(action: {
                    isPresented = false
                }) {
                    Text(cancelTitle)
                        .foregroundColor(.red)
                }
                .padding()
                
                Button(action: {
                    isPresented = false
                    okAction?()
                }) {
                    Text(okTitle)
                        .foregroundColor(.blue)
                }
                .padding()
            }
        }
        .padding()
        .frame(maxWidth: 300) // Set a maximum width for the alert
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 20)
        .padding()
    }
}

#Preview {
    CustomAlert(
        isPresented: .constant(false),
        title: "Alert Title",
        message: "This is an alert message.",
        cancelTitle: "Cancel",
        okTitle: "OK",
        okAction: {
            print("OK tapped")
        }
    )
}
