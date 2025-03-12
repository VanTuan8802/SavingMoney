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
                    .font(.custom(R.file.poppinsMediumTtf.name, size: 20))
            }
            
            Text(message)
                .multilineTextAlignment(.center)
                .font(.custom(R.file.poppinsMediumTtf.name, size: 14))
            
            HStack(spacing: 16) {
                Button(action: {
                    isPresented = false
                }) {
                    Text(cancelTitle)
                        .foregroundColor(.black)
                        .font(.custom(R.file.poppinsMediumTtf.name, size: 13))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.greyF6)
                .cornerRadius(16)
                
                Button(action: {
                    isPresented = false
                    okAction?()
                }) {
                    Text(okTitle)
                        .foregroundColor(.white)
                        .font(.custom(R.file.poppinsMediumTtf.name, size: 13))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(colors: [Color.blue4F,Color.purple8B],
                                           startPoint: .leading,
                                           endPoint: .trailing))
                .cornerRadius(16)
                
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.white)
        .cornerRadius(16)
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
