//
//  HTTPHeaders.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

enum HTTPHeader {
	case contentType(ContentType)
	
	var header: (field: String, value: String) {
		switch self {
		case .contentType(let value):   return (field: "Content-Type", value: value.rawValue)
		}
	}
}

extension HTTPHeader {
	enum ContentType: String {
		case json = "application/json"
	}
}
