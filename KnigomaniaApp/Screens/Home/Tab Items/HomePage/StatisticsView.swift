//
//  StatisticsView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 20/10/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @State private var selection = 0
    
    @State private var friends: [FriendModel] = [FriendModel(friendName: "ejfj", goalValue: 10, currentValue: 4), FriendModel(friendName: "dwqdwq", goalValue: 8, currentValue: 3), FriendModel(friendName: "ghiohgior", goalValue: 12, currentValue: 7), FriendModel(friendName: "fhioeshif", goalValue: 34, currentValue: 12)]
    
    weak var mainScreenCoordinator: MainCoordinator?
    
    var body: some View {
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
            FriendsStatisticView(friendsArray: $friends)
                .tag(10)
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    StatisticsView()
}
