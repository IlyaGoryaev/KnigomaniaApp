//
//  RequestError.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

enum RequestError: Error {
	case error(String)
	case unknown
}

extension RequestError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .error(let error):
			return error
		case .unknown:
			return "Error"
		}
	}
}
