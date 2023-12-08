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
		print(urlComponents)
		if let query = endpoint.query {
			urlComponents.queryItems = query.map {
				URLQueryItem(name: $0, value: $1)
			}
			print(query)
		}
		
		print(endpoint.body)
		
		guard let url = urlComponents.url else {
			throw RequestError.unknown
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue
		print(request)
		endpoint.header?.forEach {
			request.addValue($0.header.value, forHTTPHeaderField: $0.header.field)
		}
		
		if let body = endpoint.body {
			request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
			
			print(String(data: request.httpBody!, encoding: .utf8)!)
		}
		
		
		
		
		let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
		
		print(String(data: data, encoding: .utf8)!)
		
		guard let response = response as? HTTPURLResponse else {
			throw RequestError.error(String(data: data, encoding: .utf8)!)
		}
		print(response.statusCode)
		switch response.statusCode {
		case 200...299:
			do {
				let decodeData = try JSONDecoder().decode(T.self, from: data)
				return decodeData
			} catch(let error) {
				throw RequestError.error(error.localizedDescription)
			}
		default:
			throw RequestError.error(String(data: data, encoding: .utf8)!)
		}
	}
}
