//
//  CustomButton.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 2/3/25.
//
import SwiftUI

struct CustomButton: View {
    var title: String
    @Binding var isEnable: Bool
    var action: () -> Void
    
    var body: some View {
        Button(
            action: {
                if isEnable {
                    action()
                }
            },
            label: {
                Text(title)
                    .font(.medium14)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Group {
                            if isEnable {
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [Color.color4F80FC, Color.color8B8FEB]
                                    ),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            } else {
                                Color.colorE6E6E6
                            }
                        }
                    )
                    .cornerRadius(10)
            }
        )
        .disabled(!isEnable)
    }
}

