//
//  DateService.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation

struct DateService {
	
	static let shared = DateService()
	
	func getDateDescription(date: Date) -> String {
		let dateFomatter = DateFormatter()
		dateFomatter.dateFormat = "d.M.yyyy"
		return dateFomatter.string(from: date)
	}
	
}
