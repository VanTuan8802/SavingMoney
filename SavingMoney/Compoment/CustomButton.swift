//
//  CustomButton.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 2/3/25.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.custom(R.file.poppinsRegularTtf.name, size: 13))
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue4F, .purple8B]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomButton(
        title: "Continue"
    ) {
        print("Button pressed!")
    }
}
