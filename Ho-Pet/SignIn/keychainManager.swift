//
//  keychainManager.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 09/01/23.
//

import Foundation
import Security

class KeychainManager {
    
    enum keyChainKeys: String {
        case password
        case email
    }
    
// Password
    static func savePassword(service: String, acc: keyChainKeys, password: Data) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: acc as AnyObject,
            kSecAttrService as String : service as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    static func getPassWordKeychain(service: String, acc: keyChainKeys) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String : service as AnyObject,
            kSecAttrAccount as String: acc as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ] as [String : Any]
        
        
        var result:  AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        return result as? Data
    }
    
    static func deletePassword(service: String, acc: keyChainKeys) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: acc as AnyObject,
            kSecAttrService as String : service as AnyObject,
        ]
        SecItemDelete(query as CFDictionary)
    }
    
    
    
    
    // email
    static func saveEmail(key: keyChainKeys, account: Data) -> OSStatus {
        let query2: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String : key as AnyObject,
            kSecValueData as String: account as AnyObject,
        ]
        SecItemDelete(query2 as CFDictionary)
        return SecItemAdd(query2 as CFDictionary, nil)
    }

    
    static func getEmailKeychain(key: String) -> Data? {
        let query2 = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String : key as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ] as [String : Any]
        
        
        var result:  AnyObject?
        let status = SecItemCopyMatching(query2 as CFDictionary, &result)

        return result as? Data
    }
}
