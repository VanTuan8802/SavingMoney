//
//  AppStorageCompatible.swift
//  LoanTracker
//
//  Created by Tienvv on 14/4/25.
//

import Foundation

/// AppStorageCompatible
public protocol AppStorageCompatible {}
extension Int: AppStorageCompatible {}
extension String: AppStorageCompatible {}
extension Bool: AppStorageCompatible {}
extension Data: AppStorageCompatible {}
extension Date: AppStorageCompatible {}
extension Array: AppStorageCompatible where Element: AppStorageCompatible {}
