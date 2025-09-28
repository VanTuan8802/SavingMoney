//
//  IntroView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 4/3/25.
//

import SwiftUI

struct IntroView: View {
    let intros: [IntroEnum] = [.intro1,
                               .intro2,
                               .intro3,
                               .intro4]
    
    @State private var currentPage = 0
    
    private var onCompleted: (() -> Void)
    
    init(onCompleted: @escaping (() -> Void)) {
        self.onCompleted = onCompleted
    }

    var body: some View {
        VStack(spacing: 16) {
            Image(intros[currentPage].getImageIntro)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .top)
            
            TabView(selection: $currentPage) {
                ForEach(Array(intros.enumerated()), id: \.offset) { index, intro in
                    VStack {
                        Text(intro.getTitle)
                            .font(.custom(R.file.poppinsMediumTtf.name, size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.color4F80FC)
                            .multilineTextAlignment(.center)

                        Text(intro.getContent)
                            .font(.custom(R.file.poppinsMediumTtf.name, size: 14))
                            .padding(.horizontal, 16)
                            .foregroundColor(Color.color18181B)
                            .multilineTextAlignment(.center)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top, 16)
            .frame(height:80)
            
            Button(action: {
                if currentPage < intros.count - 1 {
                    currentPage += 1
                } else {
                    onCompleted()
                }
            }) {
                Text(R.l10n.next())
                    .font(.custom(R.file.poppinsRegularTtf.name, size: 16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.color8B8FEB)
                    .cornerRadius(10)
            }
            .padding(.top, 8)
            
            HStack(spacing: 8) {
                ForEach(intros.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }

        }
    }
}
