//
//  BasicHeaderView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import SwiftUI

struct BasicHeaderView: View {
    var leadingAction: (() -> Void)? = nil
    var leadingImageColor: Color? = nil
    
    var title: String
    var titleColor: Color? = nil
    
    var trailingImage: Image? = nil
    var trailingAction: (() -> Void)? = nil
    var trailingImageColor: Color? = nil
    
    var isFullScreen: Bool = true
    var showBack: Bool = true
    
    init(leadingAction: ( () -> Void)? = nil,
         leadingImageColor: Color? = nil,
         title: String,
         titleColor: Color? = nil,
         trailingImage: Image? = nil,
         trailingAction: ( () -> Void)? = nil,
         trailingImageColor: Color? = nil,
         isFullScreen: Bool = true,
         showBack: Bool) {
        self.leadingAction = leadingAction
        self.leadingImageColor = leadingImageColor
        self.title = title
        self.titleColor = titleColor
        self.trailingImage = trailingImage
        self.trailingAction = trailingAction
        self.trailingImageColor = trailingImageColor
        self.isFullScreen = isFullScreen
        self.showBack = showBack
    }
    
    var body: some View {
        HStack {
            if showBack {
                Button(
                    action: {
                        leadingAction?()
                    },
                    label: {
                        Image(R.image.buttonBack)
                            .renderingMode(.template)
                            .foregroundStyle(leadingImageColor ?? Color.color18181B)
                            .frame(width: 32, height: 32)
                    }
                )
            } else {
                Color.clear.frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Text(title)
                .foregroundStyle(titleColor ?? Color.color18181B)
                .font(.semibold20)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer()
            
            if let trailingAction = trailingAction,
               let image = trailingImage {
                Button(
                    action: {
                        trailingAction()
                    },
                    label: {
                        image
                            .renderingMode(.template)
                            .foregroundStyle(trailingImageColor ?? Color.color18181B)
                            .frame(width: 32, height: 32)
                    })
            } else {
                Color.clear.frame(width: 32, height: 32)
            }
        }
        .frame(height: 34)
        .padding(.horizontal, 16)
        .padding(.top, getPaddingTop())
    }
    
    private func getPaddingTop() -> CGFloat {
        isFullScreen ? 56 : 36
    }
}
