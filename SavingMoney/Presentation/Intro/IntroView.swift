//
//  IntroView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import SwiftUI

struct IntroView: View {
    let intros: [IntroEnum] = [.intro1, .intro2, .intro3, .intro4]
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            Image(intros[currentPage].getImageIntro)
                .resizable()
                .scaledToFill()
                .frame(height: 360)
                .padding(.bottom, 16)
            
            TabView(selection: $currentPage) {
                ForEach(intros.indices, id: \.self) { index in
                    VStack {
                        Text(intros[index].getTitle)
                            .font(.custom(R.file.poppinsMediumTtf.name, size: 20))
                            .fontWeight(.semibold)
                            .padding(.bottom, 8)
                            .foregroundColor(.blue4F)
                            .multilineTextAlignment(.center)
                        
                        Text(intros[index].getContent)
                            .font(.custom(R.file.poppinsMediumTtf.name, size: 14))
                            .padding(.horizontal, 16)
                            .foregroundColor(.black1B)
                            .multilineTextAlignment(.center)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.bottom, 16)

            Button(action: {
                if currentPage < intros.count - 1 {
                    currentPage += 1
                } else {
                    print("Get Started tapped!")
                }
            }) {
                Text(R.l10n.next())
                    .font(.custom(R.file.poppinsRegularTtf.name, size: 16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.purple8B)
                    .cornerRadius(10)
            }
            .accessibilityLabel(Text("Next Page"))
            .padding(.bottom, 0)

            HStack(spacing: 8) {
                ForEach(intros.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.bottom, 16)

            Spacer()
        }
    }
}

#Preview {
    IntroView()
}
