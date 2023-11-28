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
    var friendBooks: [BookModel] = [BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")]
    var onDelete: () -> Void
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    NavBar(title: .emptyTitle) {
                        mainScreenCoordinator?.backAction()
                    }
                    .frame(width: 24)
                    HStack {
                        HStack {
                            Circle()
                                .frame(width: 50, height: 50)
                            Text(friend.friendName)
                                .font(.system(size: 16))
                                .foregroundStyle(CustomColors.darkBrownColor)
                                .padding(.leading, 24)
                        }
                        Spacer()
                        HStack {
                            Text("\(Int(friend.currentValue))/\(Int(friend.goalValue))")
                                .font(.system(size: 18, weight: .medium))
                            ZStack {
                                Image("bookicon")
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(CustomColors.trackerColor)
                                Circle()
                                    .trim(from: 0, to: CGFloat(friend.currentValue / friend.goalValue))
                                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(CustomColors.orangeTrackerColor)
                                    .rotationEffect(Angle(degrees: 90))
                            }
                        }
                    }
                    .foregroundStyle(CustomColors.darkBrownColor)
                    Spacer()
                }
                .padding(.horizontal, 16)
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(CustomColors.greyColor)
                    .frame(height: 0.5)
                    .padding(.horizontal, 16)
                ScrollView {
                    BooksCollectionView(books: friendBooks, mainScreenCoordinator: mainScreenCoordinator)
                        .padding(.top, 32)
                }
                ButtonView(title: .delete, isButtonEnable: true, action: {
                    onDelete()
                })
                .padding(.top, 8)
                .padding(.bottom, 24)
                Spacer()
            }
        }
    }
}
