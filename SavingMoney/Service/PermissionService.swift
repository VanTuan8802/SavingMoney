//
//  PermissionService.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 21/11/24.
//

import Foundation
import Photos
import AVFoundation
import UIKit

class PermissionService {
    static let shared = PermissionService()

    func checkPhotoLibraryPermission() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        return status == .authorized || status == .limited
    }

    func requestPhotoLibraryPermission(completionHandler: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized, .limited:
            completionHandler(true)
        case .denied, .restricted:
            completionHandler(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                completionHandler(newStatus == .authorized || newStatus == .limited)
            }
        @unknown default:
            completionHandler(false)
        }
    }


    func checkCameraPermission() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }

    func requestCameraPermission(completionHandler: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            completionHandler(true)
        case .denied, .restricted:
            completionHandler(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                completionHandler(granted)
            }
        @unknown default:
            completionHandler(false)
        }
    }

    func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
