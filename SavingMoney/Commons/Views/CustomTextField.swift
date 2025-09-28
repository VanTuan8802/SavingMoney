//
//  CustomTextField.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import SwiftUI

struct CustomTextField: View {
    let title: String?
    let placeHolder: String
    @Binding var value: String
    @FocusState.Binding var isFocused: Bool
    var isSecure: Bool = false
    var autocapitalization: TextInputAutocapitalization = .never
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title = title {
                Text(title)
                    .font(.semibold12)
                    .foregroundStyle(Color.color18181B)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
            }
            
            ZStack(alignment: .trailing) {
                Group {
                    if isSecure && !isPasswordVisible {
                        SecureField("", text: $value)
                            .focused($isFocused)
                            .font(.medium14)
                            .foregroundStyle(Color.color18181B)
                            .padding(.leading, 12)
                    } else {
                        TextField("", text: $value)
                            .focused($isFocused)
                            .font(.medium14)
                            .foregroundStyle(Color.color18181B)
                            .textInputAutocapitalization(autocapitalization)
                            .padding(.leading, 12)
                    }
                }
                .placeholder(when: value.isEmpty) {
                    Text(placeHolder)
                        .font(.medium12)
                        .foregroundStyle(
                            Color.colorAFAFAF
                        )
                        .padding(.leading, 12)
                }
                .font(.medium12)
                .frame(height: 50)
                .background(Color.colorF6F6F6)
                .radius10
                .submitLabel(.done)
                
                if isSecure {
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 16)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture { isFocused = true }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = true
        }
    }
}
