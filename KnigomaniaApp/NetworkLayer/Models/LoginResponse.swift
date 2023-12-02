//
//  LoginResponse.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

struct LoginResponse: Decodable {
	let refreshToken: String
	let accessToken: String
}
