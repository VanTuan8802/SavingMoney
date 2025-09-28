//
//  PermissionView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 5/3/25.
//

import SwiftUI

struct PermissionView: View {
    
    @StateObject var viewModel: PermissionViewModel
    private var onCompleted: (() -> Void)?
    
    init(onCompleted: (() -> Void)?) {
        _viewModel = StateObject(wrappedValue: PermissionViewModel())
        self.onCompleted = onCompleted
    }
    
    
    var body: some View {
        VStack {
            headerView
            
            Image(R.image.permission.name, bundle: nil).padding(.bottom,24)
            
            Text(R.l10n.permissionMessage)
                .font(.medium14)
                .foregroundColor(.color18181B)
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
            )
            .padding(.horizontal, 24)
            
            PermissionSwitchView(
                labelText: R.l10n.photo(),
                permissionType: .photo,
                normalStatus: PermissionService.shared.checkPhotoLibraryPermission(),
                switchAction: {
                    PermissionService.shared.requestPhotoLibraryPermission { granted in
                        if granted {
                            print("Photo access granted.")
                        } else {
                            print("Photo access denied.")
                        }
                    }
                }
            )
            .padding(.horizontal, 24)
            
            Spacer()
            
            CustomButton(
                title: R.l10n.continue(),
                isEnable: .constant(true),
                action: {
                    onCompleted?()
                })
            .padding(.bottom, 48)
            .padding(.horizontal,24)
            
        }
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
    
    @MainActor @ViewBuilder
    private var headerView: some View {
        BasicHeaderView(
            title: R.l10n.permission(),
            showBack: false)
    }
}

