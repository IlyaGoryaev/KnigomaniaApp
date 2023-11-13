//
//  NotificationList.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import SwiftUI

struct NotificationList: NotificationCoordinatorViewProtocol {
	
	var notificationCoordinator: NotificationCoordinator?
	
	
	private let notifications = TestBookPageData.notifications
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .emptyTitle) {
					notificationCoordinator?.backAction(type: .backAction)
				}
				.padding(.vertical, 20)
				
				ScrollView {
					VStack(spacing: 24) {
						ForEach(notifications, id: \.self) { item in
							NotificationItem(notification: item)
								.onTapGesture {
									notificationCoordinator?.route(view: .descriptionNotification(notification: item))
								}
						}
					}
				}
				
				
				
				Spacer()
			}
		}
    }
}

#Preview {
    NotificationList()
}
