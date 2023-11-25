//
//  TrackerView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct TrackerView: View {
	
	var goalValue: Double
	
	var currentValue: Double
	
	var percent: Double
	
	var theta: CGFloat
	
	var isTrackerSetup: Bool
	
	init(isTrackerSetup: Bool, goalValue: Double = 0, currentValue: Double = 0){
		self.currentValue = currentValue
		self.goalValue = goalValue
		self.percent = currentValue / goalValue * 0.8
		self.theta = (Double(Float.pi) * (percent * 360) / 180)
		self.isTrackerSetup = isTrackerSetup
	}
	
	var body: some View {
		ZStack{
			Circle()
				.trim(from: 0, to: 0.8)
				.stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
				.overlay(content: {
					if !isTrackerSetup{
						Image("Book")
							.rotationEffect(Angle(degrees: -125))
							.offset(x: 200 / 2)
					}
				})
				.frame(width: 200, height: 200)
				.rotationEffect(Angle(degrees: 126))
                .foregroundStyle(CustomColors.trackerColor.opacity(0.5))
			if isTrackerSetup{
				Circle()
					.trim(from: 0, to: (currentValue / goalValue) * 0.8)
					.stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
					.overlay {
						Image("Book")
							.rotationEffect(Angle(degrees: -125))
							.offset(x: 200 / 2 * cos(theta), y: 200 / 2 * sin(theta))
					}
					.frame(width: 200, height: 200)
					.rotationEffect(Angle(degrees: 125))
					.foregroundStyle(CustomColors.yellowColor)
			}
			VStack(spacing: 8){
				Text("Прочитано")
					.font(.system(size: 16))
					.foregroundStyle(CustomColors.greyColor)
				Text("\(Int(currentValue)) / \(Int(goalValue))")
					.font(.system(size: 24, weight: .bold))
                    .foregroundStyle(CustomColors.darkBrownColor)
					.opacity(isTrackerSetup ? 1 : 0)
			}
		}
	}
}

#Preview {
	TrackerView(isTrackerSetup: false)
}