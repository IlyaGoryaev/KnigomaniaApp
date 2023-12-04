//
//  FriendsStatisticView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct FriendsStatisticView: View {
	
	var size: CGSize
	
	@State private var offsetY: CGFloat = .zero
	
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
				if friendsArray.isEmpty {
					Text("У тебя еще нет друзей в Книгомании. Брось им книжный вызов, нажав кнопку выше, чтобы следить за их прогрессом!")
						.font(.system(size: 16))
						.foregroundStyle(CustomColors.darkBrownColor)
						.padding(.top, 24)
						.padding(.horizontal, 16)
						.multilineTextAlignment(.leading)
					
				} else {
					ScrollView {
						VStack(spacing: Sizes.Padding.zero) {
							makeFriendsStatiscticsHeader()
								.zIndex(1)
							makeFriendsList()
								.padding(.top, 24)
						}
						.background {
							ScrollDetector { offset in
								offsetY = -offset
							} onDraggingEnd: { offset, velocity in
								
							}

						}
						.padding([.bottom, .top], 24)
						}
						
				}
				Spacer()
			}
		}
	}
	
	@ViewBuilder
	private func makeFriendsStatiscticsHeader() -> some View {
		let headerHeight = (size.height * 0.1)
		let minimumHeaderHeigth = 30
		let progress = max(min(-offsetY / (headerHeight - CGFloat(minimumHeaderHeigth)), 1), 0)
		GeometryReader { _ in
			ZStack {
				Rectangle()
					.fill(CustomColors.background)
				Text("Статистика друзей")
					.font(.system(size: 24, weight: .medium))
					.foregroundStyle(CustomColors.darkBrownColor)
					.scaleEffect(1 - (progress * 0.2))
					.padding(.top, Sizes.Padding.double)
					.frame(height: headerHeight)
			}
			.frame(height: max((headerHeight + offsetY), CGFloat(minimumHeaderHeigth)), alignment: .bottom)
		}
		.frame(height: headerHeight, alignment: .bottom)
		.offset(y: -offsetY)
	}
	
	@ViewBuilder
	private func makeFriendsList() -> some View {
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
	}
}

struct FriendCellView: View {
    var name: String
    var goalValue: Double
    var currentValue: Double
    
    var body: some View {
        VStack(spacing: Sizes.Padding.zero) {
            HStack {
                HStack(spacing: Sizes.Padding.zero) {
                    Circle()
                        .frame(width: 50, height: 50)
                    Text(name)
						.font(.system(size: Sizes.Padding.normal))
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

#Preview {
	GeometryReader {
		FriendsStatisticView(size: $0.size, friendsArray: .constant(FriendsTestData.friends))
	}
	
}
