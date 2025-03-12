//
//  PermissionView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 5/3/25.
//

import SwiftUI

struct PermissionView: View {
    
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(R.l10n.permission)
                    .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 20))
                    .foregroundColor(.black1B)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 4)
                
                Image(R.image.permission.name, bundle: nil).padding(.bottom,24)
                
                Text(R.l10n.permissionMessage)
                    .font(.custom(R.file.poppinsMediumTtf.name, size: 14))
                    .foregroundColor(.black1B)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 4)
                    .padding(.bottom, 36)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
                
                PermissionSwitchView(
                    labelText: R.l10n.camera(),
                    permissionType: .camera,
                    normalStatus: PermissionService.shared.checkCameraPermission(),
                    switchAction: {
                        PermissionService.shared.requestCameraPermission { granted in
                            if granted {
                                print("Camera access granted.")
                            } else {
                                print("Camera access denied.")
                            }
                        }
                    }
                ).padding(.horizontal,24)
                    .frame(height: 52)
                
                PermissionSwitchView(
                    labelText: R.l10n.photo(),
                    permissionType: .photo,
                    normalStatus: PermissionService.shared.checkPhotoLibraryPermission(),
                    switchAction: {
                        
                        PermissionService.shared.requestPhotoLibraryPermission { granted in
                            if granted {
                                print("Camera access granted.")
                                
                            } else {
                                print("Camera access denied.")
                            }
                        }
                    }
                ).padding(.horizontal,24)
                    .frame(height: 52)
                
                Spacer()
                
                CustomButton(title: R.l10n.continue(), action: {
                    navigateToLogin = true
                    UserDefaultsData.shared.nextView = .login
                }).padding(.bottom, 16)
                    .padding(.horizontal,24)
                    .navigationDestination(isPresented: $navigateToLogin) {
                        LoginView().navigationBarHidden(true)
                    }
            }
            .background(Color.white)
        }
    }
}

#Preview {
    PermissionView()
}
