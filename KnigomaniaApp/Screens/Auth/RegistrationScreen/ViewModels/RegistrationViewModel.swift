//
//  RegistrationViewModel.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 2/12/23.
//

import UIKit

final class RegistrationViewModel: ObservableObject {
	
	private let userDefaultManager = UserDefaultManager.shared
	
    func validateEmail(_ email: String) -> DataState {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return emailPredicate.evaluate(with: email) ? .successState : .errorState
    }
    
    func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func savePasswordToKeychain() {
        do {
            let userLogin = "exampleUser"
            let password = "examplePassword"
            try KeyChainManager.shared.savePassword(userLogin: userLogin, password: password)
        } catch {
            print("Error saving password: \(error)")
        }
    }
	
	func signUp(user: User) async throws {
		let loginResponse = try await AuthService().signUp(with: user)
		do {
			print(loginResponse)
			try KeyChainManager.shared.save(item: TokensInfo(accessToken: loginResponse.accessToken, accessTokenExpire: 0, refreshToken: loginResponse.refreshToken, refreshTokenExpire: 0, userLogin: user))
			userDefaultManager.login(login: user.email)
		} catch(let error) {
			print(error.localizedDescription)
			throw error
		}
	}
}
