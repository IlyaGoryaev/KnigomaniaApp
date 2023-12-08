//
//  AuthEndpoint.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

enum AuthEndpoint {
	case signUp(user: User)
	case signIn(user: User)
	case refreshTokens(user: User)
	case updatePassword(user: User)
}

extension AuthEndpoint: Endpoint {
	var path: String {
		switch self {
		case .signUp:
			return "/api/auth/signup"
		case .signIn:
			return "/api/auth/signin"
		case .refreshTokens:
			return "/api/auth/refresh"
		case .updatePassword:
			return "/api/auth/password/update"
		}
	}
	
	var method: RequestMethod {
		switch self {
		case .refreshTokens, .signIn, .signUp, .updatePassword:
			return .post
		}
	}
	
	var header: [HTTPHeader]? {
		switch self {
		case .refreshTokens, .signIn, .signUp, .updatePassword:
			return [.contentType(.json)]
		}
	}
	
	var body: [String : String]? {
		switch self {
		case .refreshTokens(let user), .signIn(let user), .signUp(let user), .updatePassword(let user):
			return [
				"email": user.email,
				"password": user.password
			]
		}
	}
	
	var query: [String : String]? {
		nil
	}
	
}
