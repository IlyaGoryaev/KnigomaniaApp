//
//  StatisticsView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 20/10/23.
//

import SwiftUI

struct StatisticsView: View {
    @State private var selection = 0    
	@State private var friends: [FriendModel] = FriendsTestData.friends
	
	weak var mainScreenCoordinator: MainCoordinator?
	
	var body: some View {
		GeometryReader { size in
			TabView(selection: $selection) {
				MyProgress(isTrackerSetup: true, goalValue: 15, currentValue: 10, mainScreenCoordinator: mainScreenCoordinator)
					.onAppear(perform: {
						DispatchQueue.main.async {
							if !friends.isEmpty{
								for i in 0...friends.count - 1 {
									friends[i].offset = 0
								}
							}
						}
					})
					.tag(0)
				FriendsStatisticView(size: size.size, friendsArray: $friends, mainScreenCoordinator: mainScreenCoordinator)
					.tag(10)
			}
			.tabViewStyle(.page)
			.ignoresSafeArea()
			
		}
	}
}

#Preview {
    StatisticsView()
}
