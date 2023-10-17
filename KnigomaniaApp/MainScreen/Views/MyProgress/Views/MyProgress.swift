//
//  MyProgress.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct MyProgress: View {
	
	var isTracketSetup: Bool = true
	
	var goalValue: Double
	
	var currentValue: Double
	
    var body: some View {
		ZStack{
			CustomColors.background.ignoresSafeArea()
			VStack(spacing: 0){
				BookChallengeView {
					print("Tap book challenge")
					
				}
				.padding(.top, 27)
				TrackerView(isTracketSetup: isTracketSetup, goalValue: goalValue, currentValue: currentValue)
					.padding(.top, 32)
				Text(isTracketSetup ? "Ты молодец! Продолжай в том же духе, чтобы достигнуть своей цели!" : "Упс! Трекер еще не настроен. Настроить сейчас?")
					.font(.system(size: 18))
					.multilineTextAlignment(.center)
					.padding(.horizontal, 16)
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.top, 48)
				if !isTracketSetup{
					ButtonView(title: "Настроить", isButtonEnable: true) {
						print("Setup")
					}
					.padding(.top, 16)
				}
			}
		}
		
    }
}

#Preview {
	MyProgress(goalValue: 540, currentValue: 500)
}
