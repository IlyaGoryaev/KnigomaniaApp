//
//  HttpClient.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import Foundation

protocol HttpClient {
	func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}
extension HttpClient {
	func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
		var urlComponents = URLComponents()
		urlComponents.scheme = endpoint.scheme
		urlComponents.host = endpoint.host
		urlComponents.path = endpoint.path
		if let query = endpoint.query {
			urlComponents.queryItems = query.map {
				URLQueryItem(name: $0, value: $1)
			}
		}
		
		guard let url = urlComponents.url else {
			throw RequestError.unknown
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue
//		endpoint.header?.forEach {
//			request.addValue($0, forHTTPHeaderField: <#T##String#>)
//		}
		
		if let body = endpoint.body {
			request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
		}
		
		let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
		
		guard let response = response as? HTTPURLResponse else {
			throw RequestError.unknown
		}
		
		switch response.statusCode {
		case 200...299:
			do {
				let decodeData = try JSONDecoder().decode(T.self, from: data)
				return decodeData
			} catch {
				throw RequestError.unknown
			}
		default:
			throw RequestError.unknown
		}
	}
}
