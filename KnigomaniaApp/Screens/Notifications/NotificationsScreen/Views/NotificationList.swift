//
//  NotificationList.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import SwiftUI

struct NotificationList: NotificationCoordinatorViewProtocol {
	
	// MARK: Dependencies
	
	@StateObject private var viewModel = NotificationListViewModel()
	
	// MARK: Properties
	
	var notificationCoordinator: NotificationCoordinator?
	
	// MARK: View
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .emptyTitle) {
					notificationCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				.padding(.bottom, Sizes.Padding.normal.rawValue)
				ScrollView {
					VStack(spacing: Sizes.Padding.normal.rawValue) {
						ForEach(viewModel.notifications.indices, id: \.self) { index in
							NotificationItem(notification: viewModel.notifications[index], false)
								.onTapGesture {
									openDescriptionScreen(index: index)
								}
						}
					}
				}
				Spacer()
			}
		}
    }
	
	// MARK: Actions
	
	private func openDescriptionScreen(index: Int) {
		viewModel.readNotification(by: index)
		notificationCoordinator?.route(view: .descriptionNotification(notification: viewModel.notifications[index]))
	}
}

// MARK: Preview

#Preview {
    NotificationList()
}
