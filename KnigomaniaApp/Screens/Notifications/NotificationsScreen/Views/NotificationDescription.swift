//
//  NotificationDescription.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import SwiftUI

struct NotificationDescription: NotificationCoordinatorViewProtocol {
	
	var notificationCoordinator: NotificationCoordinator?
	
	let notification: NotificationModel
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .emptyTitle) {
					notificationCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, 32)
				NotificationItem(notification: notification)
					.padding(.top, 32)
				Spacer()
			}
		}
    }
}

#Preview {
	NotificationDescription(notification: TestBookPageData.notifications[0])
}
