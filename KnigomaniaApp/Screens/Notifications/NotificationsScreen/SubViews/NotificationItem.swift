//
//  NotificationItem.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import SwiftUI

struct NotificationItem: View {
	
	private let notification: NotificationModel
	
	var isHidden: Bool
	
	init(notification: NotificationModel, _ isHidden: Bool) {
		self.notification = notification
		self.isHidden = isHidden
	}
	
	var body: some View {
		
		VStack(spacing: 0) {
			HStack {
				HStack(spacing: 2) {
					if !notification.isRead {
						Circle()
							.frame(width: 8, height: 8)
							.foregroundStyle(Color.red)
					}
					Text(notification.title)
						.textStyle(.boldText)
				}
				Spacer()
				Text(Date().description)
					.textStyle(.regularText)
			}
			Text(notification.textNotification)
				.lineLimit(2)
				.textStyle(.regularText)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.top, 16)
			Rectangle()
				.frame(height: 0.5)
				.padding(.top, 16)
				.opacity(isHidden ? 0 : 1)
		}
		.padding(.horizontal, 16)
		
	}
	
}

#Preview {
	NotificationItem(notification: TestBookPageData.notifications[0], true)
}
