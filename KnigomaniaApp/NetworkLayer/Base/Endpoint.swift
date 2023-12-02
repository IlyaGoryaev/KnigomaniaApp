//
//  Endpoint.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

protocol Endpoint {
	var scheme: String { get }
	var host: String { get }
	var path: String { get }
	var method: RequestMethod { get }
	var header: [HTTPHeader]? { get }
	var body: [String: Any]? { get }
	var query: [String: String]? { get }
}

extension Endpoint {
	var scheme: String {
		return "http"
	}
	
	var host: String {
		return "79.174.80.26"
	}
}

