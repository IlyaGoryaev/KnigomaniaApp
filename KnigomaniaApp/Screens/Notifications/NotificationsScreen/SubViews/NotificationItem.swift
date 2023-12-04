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
		
		VStack(spacing: Sizes.Padding.zero) {
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
				Text(DateService.shared.getDateDescription(date: Date()))
					.textStyle(.regularText)
			}
			HStack(alignment: .center) {
				if notification.hasPhoto && isHidden{
					Circle()
						.foregroundStyle(CustomColors.lightBrownColor)
						.frame(width: Sizes.ProfileImage.normal, height: Sizes.ProfileImage.normal)
				}
				Text(notification.textNotification)
					.textStyle(.regularText)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.top, Sizes.Padding.normal)
			}
			
			Rectangle()
				.frame(height: 0.5)
				.padding(.top, Sizes.Padding.normal)
				.opacity(isHidden ? 0 : 1)
		}
		.padding(.horizontal, Sizes.Padding.normal)
		
	}
	
}

#Preview {
	NotificationItem(notification: TestBookPageData.notifications[0], true)
}
