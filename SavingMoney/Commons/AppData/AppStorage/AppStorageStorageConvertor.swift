//
//  AppStorageStorageConvertor.swift
//  LoanTracker
//
//  Created by Tienvv on 14/4/25.
//

import Foundation

/// AppStorageStorageConvertor
public protocol AppStorageStorageConvertor {
    /// Exposed
    associatedtype Exposed
    
    /// AppStorageCompatible
    associatedtype AppStorage: AppStorageCompatible

    /// convertToPersistentStorage
    func convertToPersistentStorage(_ exposedValue: Exposed) -> AppStorage
    /// convertToExposedType
    func convertToExposedType(_ persistedValue: AppStorage) throws -> Exposed
}

public struct IdentityStorageConvertor<Exposed>: AppStorageStorageConvertor where Exposed: AppStorageCompatible {
    public func convertToExposedType(_ persistedValue: Exposed) -> Exposed {
        return persistedValue
    }

    public func convertToPersistentStorage(_ exposedValue: Exposed) -> Exposed {
        return exposedValue
    }
}

public struct RawRepresentableStorageConvertor<Exposed>: AppStorageStorageConvertor where Exposed: RawRepresentable, Exposed.RawValue: AppStorageCompatible {
    public func convertToExposedType(_ persistedValue: Exposed.RawValue) -> Exposed {
        return Exposed(rawValue: persistedValue)!
    }

    public func convertToPersistentStorage(_ exposedValue: Exposed) -> Exposed.RawValue {
        return exposedValue.rawValue
    }
}

public struct CodableStorageConvertor<Exposed>: AppStorageStorageConvertor where Exposed: Codable {
    private let jsonEncoder = JSONEncoder()
    private let jsonDecoder = JSONDecoder()

    public func convertToExposedType(_ persistedValue: Data) throws -> Exposed {
        return try jsonDecoder.decode(Exposed.self, from: persistedValue)
    }

    public func convertToPersistentStorage(_ exposedValue: Exposed) -> Data {
        do {
            return try jsonEncoder.encode(exposedValue)
        } catch let error {
            fatalError("Can not encode(\(error))")
        }

    }
}
