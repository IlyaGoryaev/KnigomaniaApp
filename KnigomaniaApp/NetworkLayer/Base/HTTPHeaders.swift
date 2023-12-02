//
//  HTTPHeaders.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

enum HTTPHeader {
	case contentType(ContentType)
}

extension HTTPHeader {
	enum ContentType: String {
		case json = "application/json"
	}
}
