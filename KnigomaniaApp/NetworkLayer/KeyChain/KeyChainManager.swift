//
//  KeyChain.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation
import KeychainAccess

protocol KeyChainManagerProtocol {
	
	func save(item: TokensInfo)
	func getData() -> String?
	func update(item: TokensInfo)
	func delete()
    func savePassword(password: String)
	
}

final class KeyChainManager: KeyChainManagerProtocol {
	
	private var keychain: Keychain
	private let userDefaultManager = UserDefaultManager.shared
	static let shared = KeyChainManager()
	private init() {
		self.keychain = Keychain(service: "Tokens")
	}
	
	func save(item: TokensInfo) {
		keychain[item.userLogin.email] = item.accessToken
	}
	
	func getData() -> String? {
		guard let currentLogin = userDefaultManager.getValue() else { return nil }
		return keychain[currentLogin]
	}
	
	func update(item: TokensInfo){
		guard let currentLogin = userDefaultManager.getValue() else { return }
		keychain[currentLogin] = item.accessToken
	}
	
	func delete() {
		guard let currentLogin = userDefaultManager.getValue() else { return }
		keychain[currentLogin] = nil
	}
	
	func savePassword(password: String) {
		guard let currentLogin = userDefaultManager.getValue() else { return }
		keychain[currentLogin + "password"] = password
	}
	
	
}
