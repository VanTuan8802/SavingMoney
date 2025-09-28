//
//  PermissonSwitchView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/11/24.
//

import SwiftUI
import AVFoundation
import Photos
import SnapKit

enum PermissionType {
    case camera
    case photo
}

struct PermissionSwitchView: View {
    let labelText: String
    let permissionType: PermissionType
    let normalStatus: Bool
    let switchAction: (() -> Void)
    
    @State private var isOn: Bool
    
    init(labelText: String,
         permissionType: PermissionType,
         normalStatus: Bool,
         switchAction: @escaping (() -> Void)) {
        self.labelText = labelText
        self.permissionType = permissionType
        self.normalStatus = normalStatus
        self.switchAction = switchAction
        _isOn = State(initialValue: normalStatus)
    }
    
    var body: some View {
        HStack {
            Text(labelText)
                .font(.medium14)
                .foregroundColor(.black)
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .onChange(of: isOn) { newValue in
                    if newValue != normalStatus {
                        switchAction()
                    }
                }
        }
        .padding(.horizontal, 16)
        .frame(height: 52)
        .background(Color.white)
        .radius20
        .roundedCornerWithBorder(
            lineWidth: 1,
            borderColor: Color.colorE6E6E6,
            radius: 20
        )
    }
}


#Preview {
    PermissionSwitchView(
        labelText: R.l10n.photo(),
        permissionType: .photo,
        normalStatus: PermissionService.shared.checkPhotoLibraryPermission(),
        switchAction: {
            PermissionService.shared.requestPhotoLibraryPermission { granted in
                print(granted ? "Granted" : "Denied")
            }
        }
    )
}

