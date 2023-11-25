//
//  NotificationListViewModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Combine

class NotificationListViewModel: ObservableObject {
	
	@Published var notifications = TestBookPageData.notifications
	
	func readNotification(by index: Int) {
		notifications[index].read()
	}
	
}
