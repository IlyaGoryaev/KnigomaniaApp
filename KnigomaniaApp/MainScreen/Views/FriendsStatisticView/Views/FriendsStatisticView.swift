//
//  FriendsStatisticView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct FriendsStatisticView: View {
	
	var friendsArray: [FriendModel] = []
	
	var body: some View {
		ZStack{
			CustomColors.background.ignoresSafeArea()
			VStack(spacing: 0){
				BookChallengeView {
					print("Tap book challendge")
				}
				.padding(.top, 27)
				Text("Статистика друзей")
					.font(.system(size: 20, weight: .medium))
					.padding(.top, 40)
				if friendsArray.isEmpty{
					Text("У тебя еще нет друзей в Книгомании. Брось им книжный вызов, нажав кнопку выше, чтобы следить за их прогрессом!")
						.font(.system(size: 16))
						.foregroundStyle(CustomColors.darkBrownColor)
						.padding(.top, 24)
						.padding(.horizontal, 16)
						.multilineTextAlignment(.leading)
					
				} else {
					VStack(spacing: 16.5){
						ForEach(friendsArray.indices, id: \.self){ index in
							FriendCellView(name: friendsArray[index].friendName, goalValue: friendsArray[index].goalValue, currentValue: friendsArray[index].currentValue)
						}
					}
					.padding(.top, 40)}
			}
		}
	}
}

struct FriendCellView: View {
	
	var name: String
	
	var goalValue: Double
	
	var currentValue: Double
	
	@State private var startingOffsetX: CGFloat = 0
	@State private var currentDragOffsetX: CGFloat = 0
	@State private var endingOffsetX: CGFloat = 0
	
	@State private var isSwiped: Bool = false
		
	var body: some View {
		VStack(spacing: 0){
			HStack{
				HStack(spacing: 0){
					Circle()
						.frame(width: 50, height: 50)
					Text(name)
						.font(.system(size: 16))
						.padding(.leading, 24)
				}
				Spacer()
				HStack{
					Text("\(Int(currentValue))/\(Int(goalValue))")
						.font(.system(size: 18, weight: .medium))
					ZStack{
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
		.offset(x: endingOffsetX)
		.offset(x: startingOffsetX)
		.offset(x: currentDragOffsetX)
		.gesture(DragGesture(minimumDistance: 3, coordinateSpace: .local)
			.onChanged({ value in
				withAnimation(.spring){
					currentDragOffsetX = value.translation.width
				}
			})
				.onEnded({ value in
					if isSwiped{
						withAnimation {
							if currentDragOffsetX < -150{
								endingOffsetX = -startingOffsetX
								currentDragOffsetX = -100
							} else if endingOffsetX != 0 && currentDragOffsetX > 150{
								endingOffsetX = 0
								currentDragOffsetX = 0
							}
							currentDragOffsetX = 0
						}
						isSwiped.toggle()
					} else {
						
					}
					
				})
		)
	}
}

#Preview {
	FriendsStatisticView(friendsArray: [FriendModel(friendName: "Антон", goalValue: 12, currentValue: 10)])
}
