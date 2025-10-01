//
//  BudgetView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 1/10/25.
//

import SwiftUI
import Factory

struct BudgetView: View {
    @StateObject var viewModel: BudgetViewModel
    @InjectedObject(\.app) internal var app: AppManager
    @FocusState private var isAmountFocused: Bool
    
    private var onCompleted: (() -> Void)?
    
    init(onCompleted: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: BudgetViewModel())
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        VStack {
            headerView
            
            contentView
            inputView
            Spacer()
            actionView
        }
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
    
    @MainActor @ViewBuilder
    private var headerView: some View {
        BasicHeaderView(title: R.l10n.setYourBudget())
    }
    
    @MainActor @ViewBuilder
    private var contentView: some View {
        Image(R.image.budget)
            .padding(.bottom, 20)
        Text(R.l10n.pleaseEnterYourBudget)
            .font(.medium12)
            .foregroundStyle(Color.color343434)
            .multilineTextAlignment(.center)
        
    }
    
    @MainActor @ViewBuilder
    private var inputView: some View {
        HStack(spacing: 0) {
            TextField("", text: $viewModel.budget)
                .keyboardType(.decimalPad)
                .focused($isAmountFocused)
                .font(.semibold32)
                .foregroundStyle(Color.color343434)
                .multilineTextAlignment(.center)
                .onChange(of: viewModel.budget) { newValue in
                    let formatted = newValue.toCurrency(locale: Locale.current)
                    if formatted != newValue {
                        viewModel.budget = formatted
                    }
                }
                .fixedSize(horizontal: true, vertical: false)
                .placeholder(
                    when: viewModel.budget.isEmpty,
                    placeholder: {
                        Text("0")
                            .font(.semibold32)
                            .foregroundStyle(Color.color343434)
                    }
                )
            
            Text("$")
                .font(.semibold32)
                .foregroundStyle(Color.color343434)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 20)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.color8B8FEB, lineWidth: 1)
        )
        .padding(.horizontal, 24)
        .contentShape(Rectangle())
        .onTapGesture {
            isAmountFocused = true
        }
    }
    
    @MainActor @ViewBuilder
    private var actionView: some View {
        CustomButton(
            title: R.l10n.save(),
            isEnable: .constant(true),
            action: {
                onCompleted?()
        })
        .padding(.bottom, 48)
        .padding(.horizontal, 24)
    }
}
