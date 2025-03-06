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

struct PermissionSwitchView: UIViewRepresentable {
    let labelText: String
    let permissionType: PermissionType
    let normalStatus: Bool
    let switchAction: (() -> Void)? 

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = Color(.whiteE6).cgColor
        view.layer.masksToBounds = true

        let label = UILabel()
        label.text = labelText
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black

        let toggleSwitch = UISwitch()
        toggleSwitch.isOn = normalStatus
        toggleSwitch.addTarget(context.coordinator, action: #selector(context.coordinator.switchToggled(_:)), for: .valueChanged)

        view.addSubview(label)
        view.addSubview(toggleSwitch)

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        toggleSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(permissionType: permissionType, switchAction: switchAction)
    }

    class Coordinator: NSObject {
        let permissionType: PermissionType
        let switchAction: (() -> Void)?

        init(permissionType: PermissionType, switchAction: (() -> Void)?) {
            self.permissionType = permissionType
            self.switchAction = switchAction
        }

        @objc func switchToggled(_ sender: UISwitch) {
            _ = PermissionService.shared

            if !sender.isOn {
                switchAction?()
                return
            }
        }
    }
}

#Preview {
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
    )
}
