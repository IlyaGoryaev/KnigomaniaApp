//
//  KeyChain.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

protocol KeyChainManagerProtocol {
	
	func save(item: TokensInfo) throws
	func getData(userLogin: String) throws -> Data?
	func update(item: TokensInfo)
	func delete()
    func savePassword(userLogin: String, password: String) throws
	
}

final class KeyChainManager: KeyChainManagerProtocol {
	
	enum KeyChainError: Error {
		case unknownError(OSStatus)
	}
	
	static let shared = KeyChainManager()
	private init() { }
	
	func save(item: TokensInfo) throws {
		
		let query: [CFString: Any] = [
			kSecClass: kSecClassGenericPassword,
			kSecAttrAccount: item.userLogin.email,
			kSecValueData: item.accessToken
		]
		
		let status = SecItemAdd(query as CFDictionary, nil)
		print(status)
		guard status == errSecSuccess else {
			throw KeyChainError.unknownError(status)
		}
		print("Save")
	}
	
	func getData(userLogin: String) throws -> Data? {
		let query: [CFString: Any] = [
			kSecClass: kSecClassGenericPassword,
			kSecAttrAccount: userLogin,
			kSecReturnData: kCFBooleanTrue as Any
		]
		
		var result: AnyObject?
		
		let status = SecItemCopyMatching(query as CFDictionary, &result)
		
		guard status == errSecSuccess else { throw KeyChainError.unknownError(status) }
		
		
		return result as? Data
	}
	
	func update(item: TokensInfo) {
		
	}
	
	func delete() {
		
	}
    
    func savePassword(userLogin: String, password: String) throws {
        let passwordData = password.data(using: .utf8)

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: userLogin,
            kSecValueData: passwordData as Any
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status == errSecSuccess else {
            throw KeyChainError.unknownError(status)
        }
        print("password saved successfully")
    }
}
