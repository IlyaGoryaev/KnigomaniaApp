//
//  FriendsStatisticView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct FriendsStatisticView: View {
	@Binding var friendsArray: [FriendModel]
    
    weak var mainScreenCoordinator: MainCoordinator?
		
	var body: some View {
		ZStack {
			CustomColors.background.ignoresSafeArea()
			VStack(spacing: 0) {
				BookChallengeView {
					print("Tap book challenge")
				}
                .frame(height: 96)
				.padding(.top, 24)
				Text("Статистика друзей")
					.font(.system(size: 20, weight: .medium))
                    .foregroundStyle(CustomColors.darkBrownColor)
					.padding(.top, 40)
				if friendsArray.isEmpty {
					Text("У тебя еще нет друзей в Книгомании. Брось им книжный вызов, нажав кнопку выше, чтобы следить за их прогрессом!")
						.font(.system(size: 16))
						.foregroundStyle(CustomColors.darkBrownColor)
						.padding(.top, 24)
						.padding(.horizontal, 16)
						.multilineTextAlignment(.leading)
					
				} else {
					ScrollView {
						VStack(spacing: 16.5) {
							ForEach(friendsArray.indices, id: \.self) { index in
								ZStack {
									FriendCellView(name: friendsArray[index].friendName, goalValue: friendsArray[index].goalValue, currentValue: friendsArray[index].currentValue)
										.background(CustomColors.background)
                                        .onTapGesture {
                                            let friend = friendsArray[index]
                                            mainScreenCoordinator?.friendPage(friend: friend) {
                                                friendsArray.remove(at: index)
                                            }
                                        }
								}
							}
						}
                        .padding(.top, 24)
					}
                    .padding(.bottom, 24)
				}
				Spacer()
			}
		}
	}
}

struct FriendCellView: View {
    var name: String
    var goalValue: Double
    var currentValue: Double
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack(spacing: 0) {
                    Circle()
                        .frame(width: 50, height: 50)
                    Text(name)
                        .font(.system(size: 16))
                        .padding(.leading, 24)
                }
                Spacer()
                HStack {
                    Text("\(Int(currentValue))/\(Int(goalValue))")
                        .font(.system(size: 18, weight: .medium))
                    ZStack {
                        Image("bookicon")
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 28, height: 28)
                            .foregroundStyle(CustomColors.trackerColor)
                        Circle()
                            .trim(from: 0, to: CGFloat(currentValue / goalValue))
                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                            .frame(width: 28, height: 28)
                            .foregroundStyle(CustomColors.orangeTrackerColor)
                            .rotationEffect(Angle(degrees: 90))
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 16.5)
            .foregroundStyle(CustomColors.darkBrownColor)
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 0.5)
                .padding(.horizontal, 16)
        }
    }
}
