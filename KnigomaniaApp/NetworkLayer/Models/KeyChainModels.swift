//
//  KeyChainModels.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

struct TokensInfo: Codable {
	let accessToken: String
	let accessTokenExpire: Int64
	let refreshToken: String
	let refreshTokenExpire: Int64
	let userLogin: User
}
