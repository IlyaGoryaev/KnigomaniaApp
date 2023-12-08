//
//  UserDefaultManager.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 08.12.2023.
//

import Foundation

protocol UserDefaultManagerProtocol {
	
	func isAuthorize() -> Bool
	func logout()
	func login(login: String)
	
}

final class UserDefaultManager: UserDefaultManagerProtocol {
	
	private let userDefault = UserDefaults.standard
	
	private let key = "login"
	
	static let shared = UserDefaultManager()
	private init() { }
	
	func isAuthorize() -> Bool {
		userDefault.string(forKey: key) != nil ? true : false
	}
	
	func logout() {
		userDefault.set(nil, forKey: key)
	}
	
	func login(login: String) {
		userDefault.set(login, forKey: key)
	}
	
	func getValue() -> String? {
		userDefault.string(forKey: key)
	}
}
