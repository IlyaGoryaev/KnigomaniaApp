//
//  FriendPageView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/11/23.
//

import SwiftUI

struct FriendPageView: View {
    weak var mainScreenCoordinator: MainCoordinator?
    
    var friend: FriendModel
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                NavBar(title: .emptyTitle) {
                    mainScreenCoordinator?.backAction()
                }
                HStack {
                    Text("Имя:")
                        .font(.system(size: 16))
                        .foregroundStyle(CustomColors.darkBrownColor)
                    Spacer()
                    Text(friend.friendName)
                        .font(.system(size: 16))
                        .foregroundStyle(CustomColors.darkBrownColor)
                }
                .padding(.horizontal, 16)
                .padding(.top, 24)
                ButtonView(title: .delete, isButtonEnable: true, action: {
                    
                })
                .padding(.top, 16)
                Spacer()
            }
        }
    }
}
