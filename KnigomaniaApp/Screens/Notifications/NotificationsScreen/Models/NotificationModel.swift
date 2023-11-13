//
//  NotificationModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import Foundation

struct NotificationModel: Decodable, Hashable {
	
	let title: String
	let textNotification: String
	let date: String
	var isRead: Bool
	
	mutating func read() {
		isRead.toggle()
	}
	
}
