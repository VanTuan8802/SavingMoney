//
//  AppStorage.swift
//  LoanTracker
//
//  Created by Tienvv on 14/4/25.
//

import Foundation

private var global_appStorageUserDefaults = UserDefaults.standard

// public class EphemeralUserDefaultsLifeCycleForTest {
class EphemeralUserDefaultsLifeCycleForTest {
    // public let suiteName: String
    let suiteName: String

    // public let currentUserDefaults: UserDefaults
    let currentUserDefaults: UserDefaults

    private let previousUserDetaults: UserDefaults

    // public init() {
    init() {
        suiteName = UUID().uuidString
        currentUserDefaults = UserDefaults(suiteName: suiteName)!
        previousUserDetaults = global_appStorageUserDefaults
        global_appStorageUserDefaults = currentUserDefaults
    }

    deinit {
        UserDefaults().removePersistentDomain(forName: suiteName)
        global_appStorageUserDefaults = previousUserDetaults
    }
}

@propertyWrapper
// public struct AppStorage<Exposed, NonOptionalExposed, Convertor> where Convertor: AppStorageStorageConvertor, Convertor.Exposed == NonOptionalExposed {
struct AppStorage<Exposed, NonOptionalExposed, Convertor> where Convertor: AppStorageStorageConvertor, Convertor.Exposed == NonOptionalExposed {

    let key: String
    let defaultValue: Exposed
    private let valueConvertor: Convertor

    private init(key: String, default defaultValue: Exposed, valueConvertor: Convertor) {
        guard Exposed.self == Convertor.Exposed.self || Exposed.self == Optional<Convertor.Exposed>.self else {
            preconditionFailure("Invalid AppStorage generic arguments")
        }
        self.key = key
        self.defaultValue = defaultValue
        self.valueConvertor = valueConvertor
    }

    // public var wrappedValue: Exposed {
    var wrappedValue: Exposed {
        get {
            guard let typelessStored = global_appStorageUserDefaults.value(forKey: key) else { return defaultValue }
            guard let stored = typelessStored as? Convertor.AppStorage else {
                fatalError("Value stored at key \(key) was not of type \(String(describing: Convertor.AppStorage.self))")
            }
            return (try? valueConvertor.convertToExposedType(stored) as? Exposed) ?? defaultValue
        }
        set {
            if let nonOptionalNewValue = newValue as? NonOptionalExposed {
                let valueToStore = valueConvertor.convertToPersistentStorage(nonOptionalNewValue)
                global_appStorageUserDefaults.setValue(valueToStore, forKey: key)
            } else {
                global_appStorageUserDefaults.setValue(nil, forKey: key)
            }
            global_appStorageUserDefaults.synchronize()
        }
    }
}

// MARK: - Initialisers
extension AppStorage where Convertor == IdentityStorageConvertor<NonOptionalExposed>, Exposed == NonOptionalExposed {
    // public init(_ key: String, default defaultValue: Exposed) {
    init(_ key: String, default defaultValue: Exposed) {
        self.init(key: key, default: defaultValue, valueConvertor: .init())
    }
    // public init<T: RawRepresentable>(_ key: T, default defaultValue: Exposed) where T.RawValue == String {
    init<T: RawRepresentable>(_ key: T, default defaultValue: Exposed) where T.RawValue == String {
        self.init(key: key.rawValue, default: defaultValue, valueConvertor: .init())
    }
}

extension AppStorage where Convertor == IdentityStorageConvertor<NonOptionalExposed>, Exposed == NonOptionalExposed? {
    // public init(_ key: String) {
    init(_ key: String) {
        self.init(key: key, default: nil, valueConvertor: .init())
    }
    // public init<T: RawRepresentable>(_ key: T) where T.RawValue == String {
    init<T: RawRepresentable>(_ key: T) where T.RawValue == String {
        self.init(key: key.rawValue, default: nil, valueConvertor: .init())
    }
}

extension AppStorage where Convertor == RawRepresentableStorageConvertor<NonOptionalExposed>, NonOptionalExposed: RawRepresentable, Exposed == NonOptionalExposed {
    // public init(_ key: String, default defaultValue: Exposed) {
    init(_ key: String, default defaultValue: Exposed) {
        self.init(key: key, default: defaultValue, valueConvertor: RawRepresentableStorageConvertor())
    }
    // public init<T: RawRepresentable>(_ key: T, default defaultValue: Exposed) where T.RawValue == String {
    init<T: RawRepresentable>(_ key: T, default defaultValue: Exposed) where T.RawValue == String {
        self.init(key: key.rawValue, default: defaultValue, valueConvertor: RawRepresentableStorageConvertor())
    }
}

extension AppStorage where Convertor == RawRepresentableStorageConvertor<NonOptionalExposed>, NonOptionalExposed: RawRepresentable, Exposed == NonOptionalExposed? {
    // public init(_ key: String) {
    init(_ key: String) {
        self.init(key: key, default: nil, valueConvertor: RawRepresentableStorageConvertor())
    }
    // public init<T: RawRepresentable>(_ key: T) where T.RawValue == String {
    init<T: RawRepresentable>(_ key: T) where T.RawValue == String {
        self.init(key: key.rawValue, default: nil, valueConvertor: RawRepresentableStorageConvertor())
    }
}

extension AppStorage where Convertor == CodableStorageConvertor<NonOptionalExposed>, Exposed == NonOptionalExposed {
    // public init(encodedKey key: String, default defaultValue: Exposed) {
    init(encodedKey key: String, default defaultValue: Exposed) {
        self.init(key: key, default: defaultValue, valueConvertor: CodableStorageConvertor())
    }
    // public init<T: RawRepresentable>(encodedKey key: T, default defaultValue: Exposed) where T.RawValue == String {
    init<T: RawRepresentable>(encodedKey key: T, default defaultValue: Exposed) where T.RawValue == String {
        self.init(key: key.rawValue, default: defaultValue, valueConvertor: CodableStorageConvertor())
    }
}

extension AppStorage where Convertor == CodableStorageConvertor<NonOptionalExposed>, Exposed == NonOptionalExposed? {
    // public init(encodedKey key: String) {
    init(encodedKey key: String) {
        self.init(key: key, default: nil, valueConvertor: CodableStorageConvertor())
    }
    // public init<T: RawRepresentable>(encodedKey key: T) where T.RawValue == String {
    init<T: RawRepresentable>(encodedKey key: T) where T.RawValue == String {
        self.init(key: key.rawValue, default: nil, valueConvertor: CodableStorageConvertor())
    }
}
