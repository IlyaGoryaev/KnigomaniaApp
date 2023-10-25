//
//  FriendsStatisticView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct FriendsStatisticView: View {
	
	@Binding var friendsArray: [FriendModel]
	
	@GestureState var isDragging = false
		
	var body: some View {
		ZStack {
			CustomColors.background.ignoresSafeArea()
			VStack(spacing: 0) {
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
					ScrollView{
						VStack(spacing: 16.5) {
							ForEach(friendsArray.indices, id: \.self){ index in
								ZStack{
									HStack{
										Spacer()
										Text("Удалить")
											.foregroundStyle(Color.white)
											.padding(.horizontal, 24)
											.padding(.vertical, 10)
											.background(CustomColors.orangeButtonColor)
											.clipShape(RoundedRectangle(cornerRadius: 10))
											.padding(.trailing, 24)
											.onTapGesture {
												deleteFriend(index: index)
											}
									}
									FriendCellView(name: friendsArray[index].friendName, goalValue: friendsArray[index].goalValue, currentValue: friendsArray[index].currentValue)
										.background(CustomColors.background)
										.offset(x: friendsArray[index].offset)
										.gesture(DragGesture()
											.updating($isDragging, body: { value, state, _ in
												state = true
												onChanged(value: value, index: index)
											})
												.onChanged({ (value) in
													onChanged(value: value, index: index)
												})
													.onEnded({ (value) in
														onEnded(value: value, index: index)
													}))
										.gesture(TapGesture().onEnded({ _ in
											withAnimation {
												friendsArray[index].offset = 0
											}
										}))
								}
								
							}
						}
						.padding(.top, 40)

					}
					.frame(height: 250)
				}
				Spacer()
			}
		}
	}
	
	func deleteFriend(index: Int){
		friendsArray.remove(at: index)
	}
	
	func onChanged(value: DragGesture.Value, index: Int){
		if value.translation.width < 0 && isDragging && friendsArray[index].offset != -140 {
			friendsArray[index].offset = value.translation.width
			DispatchQueue.main.async {
				for i in 0...friendsArray.count - 1{
					withAnimation {
						if i != index{
							friendsArray[i].offset = 0
						}
					}
				}
			}
		}
	}
	
	func onEnded(value: DragGesture.Value, index: Int){
		
		withAnimation {
			
			if -value.translation.width >= 100{
				friendsArray[index].offset = -140
			} else {
				friendsArray[index].offset = 0
			}
			
		}
		
	}
}
struct FriendCellView: View {
	
	var name: String
	
	var goalValue: Double
	
	var currentValue: Double
	
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
	}
}

//#Preview {
//	FriendsStatisticView(friendsArray: [FriendModel(friendName: "Антон", goalValue: 12, currentValue: 10), FriendModel(friendName: "fiohewofhiwe", goalValue: 45, currentValue: 34)])
//}
