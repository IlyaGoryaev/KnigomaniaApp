//
//  UserModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation

enum Gender: Codable {
	case male
	case female
}

struct UserModel: Codable {
	var firstName: String
	var secondName: String
	var gender: Gender
	var password: String
	var email: String
}
