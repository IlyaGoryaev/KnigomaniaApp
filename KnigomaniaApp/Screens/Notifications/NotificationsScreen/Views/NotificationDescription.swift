//
//  NotificationDescription.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import SwiftUI

struct NotificationDescription: NotificationCoordinatorViewProtocol {
	
	// MARK: Dependencies

	var notificationCoordinator: NotificationCoordinator?

	// MARK: Properties
	
	@State var notification: NotificationModel
	
	// MARK: View
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero.rawValue) {
				NavBar(title: .emptyTitle) {
					notificationCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				NotificationItem(notification: notification, true)
					.padding(.top, Sizes.Padding.large.rawValue)
				ActionView()
					.opacity(notification.hasAction ? 1 : 0)
				Spacer()
			}
		}
		.onAppear {
			notification.read()
		}
    }
}

// MARK: Preview

#Preview {
	NotificationDescription(notification: TestBookPageData.notifications[0])
}
