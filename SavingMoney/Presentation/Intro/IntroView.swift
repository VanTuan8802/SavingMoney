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
    @State private var navigateToPermission = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(intros[currentPage].getImageIntro)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .top)
                
                TabView(selection: $currentPage) {
                    ForEach(intros.indices, id: \.self) { index in
                        VStack {
                            Text(intros[index].getTitle)
                                .font(.custom(R.file.poppinsMediumTtf.name, size: 20))
                                .fontWeight(.semibold)
                                .fixedSize()
                                .foregroundColor(.blue4F)
                                .multilineTextAlignment(.center)
                                .padding(.top, 0)

                            Text(intros[index].getContent)
                                .font(.custom(R.file.poppinsMediumTtf.name, size: 14))
                                .padding(.horizontal, 16)
                                .fixedSize()
                                .foregroundColor(.black1B)
                                .multilineTextAlignment(.center)
                                .padding(.top, 0)
                            
                        }
                        .tag(index)
                        .padding(.top,0)
                        .frame(alignment: .top)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, 16)
                .frame(height:80)
                
                Button(action: {
                    if currentPage < intros.count - 1 {
                        currentPage += 1
                    } else {
                        navigateToPermission = true
                    }
                }) {
                    Text(R.l10n.next())
                        .font(.custom(R.file.poppinsRegularTtf.name, size: 16))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.purple8B)
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
            .padding(.bottom, 16)
            .navigationDestination(isPresented: $navigateToPermission) {
                PermissionView().navigationBarHidden(true)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    IntroView()
}
