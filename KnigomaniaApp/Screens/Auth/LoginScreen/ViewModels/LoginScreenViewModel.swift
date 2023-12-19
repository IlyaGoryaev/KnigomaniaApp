//
//  LoginScreenViewModel.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/12/23.
//

import UIKit

class LoginScreenViewModel: ObservableObject {
	
	private let userDefaultManager = UserDefaultManager.shared
	
    func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func validateEmail(_ email: String) -> DataState {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return emailPredicate.evaluate(with: email) ? .successState : .errorState
     }
    
    func validatePassword() -> DataState {
        // validate password
		return .successState
    }
	
	func logInUser(user: User) async throws {
		do {
			let loginResponse = try await AuthService().signIn(with: user)
			KeyChainManager.shared.save(item: TokensInfo(accessToken: loginResponse.accessToken, accessTokenExpire: 0, refreshToken: loginResponse.refreshToken, refreshTokenExpire: 0, userLogin: user))
			userDefaultManager.login(login: user.email)
			print(KeyChainManager.shared.getData())
		} catch(let error) {
			print(error)
		}
		
	}
}
