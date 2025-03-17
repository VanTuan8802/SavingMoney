//
//  BudgetView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 12/3/25.
//

import SwiftUI

struct BudgetView: View {
    @State private var budgetAmount: String = ""
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(R.l10n.setYourBudget)
                    .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 20))
                    .padding(.top, 16)
                    .frame(height: 64)
                
                Image(R.image.budget.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack(spacing: 16) {
                    Text(R.l10n.setYourBudgetMessage)
                        .font(.custom(R.file.poppinsMediumTtf.name, size: 12))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue4F, lineWidth: 1)
                            .frame(height: 74)
                        
                        HStack(spacing: 8) {
                            Text(UserDefaultsData.shared.currency.symbol)
                                .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 20))
                                .foregroundColor(.black)
                            
                            TextField("", text: $budgetAmount)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                        }
                        .frame(height: 74)
                        .padding(.horizontal, 16)
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                CustomButton(title: R.l10n.save()) {
                    UserDefaultsData.shared.budgetValue = Double(budgetAmount) ?? 0
                    UserDefaultsData.shared.nextView = .home
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .padding(.top, 16)
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView().navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    BudgetView()
}
