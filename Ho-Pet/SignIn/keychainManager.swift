//
//  keychainManager.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 09/01/23.
//

import Foundation

class KeychainManager {
    
    static func save(account: String, password: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        print("saved")
    }
    
    static func get() throws {
    }
    
}
