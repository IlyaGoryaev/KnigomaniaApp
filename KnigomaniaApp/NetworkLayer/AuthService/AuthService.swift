//
//  AuthService.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

protocol AuthServiceProtocol {
	func signUp(with user: User) async throws -> LoginResponse
	func signIn(with user: User) async throws -> Bool
	func refreshTokens(for user: User) async throws -> Bool
	func updatePassword(for user: User) async throws -> Bool
}

final class AuthService: AuthServiceProtocol, HttpClient {
	func signUp(with user: User) async throws -> LoginResponse {
		return try await request(endpoint: AuthEndpoint.signIn(user: user))
	}
	
	func signIn(with user: User) async throws -> Bool {
		return try await request(endpoint: AuthEndpoint.signUp(user: user))
	}
	
	func refreshTokens(for user: User) async throws -> Bool {
		return try await request(endpoint: AuthEndpoint.refreshTokens(user: user))
	}
	
	func updatePassword(for user: User) async throws -> Bool {
		return try await request(endpoint: AuthEndpoint.updatePassword(user: user))
	}
	
}
