//
//  MyProgress.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct MyProgress: View {
    // трекер не настроен
    let trackerText = "Упс! Трекер еще не настроен. Настроить сейчас?"
    // если пока 0 прочитанных книг
    let firstTrackerText = "Самое сложное - начать. Но мы уверены, что ты справишься! Если не знаешь, что почитать, загляни на страницу рекомендаций."
    // если прогресс >0, но меньше 50%
    let secondTrackerText = "Ты молодец! Продолжай в том же духе, чтобы достигнуть цели!"
    // если прогресс больше 50% от цели, но меньше 100%
    let thirdTrackerText = "Супер! Цель уже совсем близко!"
    // цель выполнена
    let fourthTrackerText = "Ура! Ты достиг своей цели!"
    
    var isTrackerSetup: Bool = true
    var goalValue: Double
    var currentValue: Double
    
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
                TrackerView(isTracketSetup: isTrackerSetup, goalValue: goalValue, currentValue: currentValue)
                    .padding(.top, 32)
                if isTrackerSetup {
                    if currentValue == 0 {
                        Text(firstTrackerText)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .foregroundStyle(CustomColors.darkBrownColor)
                            .padding(.top, 48)
                    } else if currentValue < 0.5 * goalValue {
                        Text(secondTrackerText)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .foregroundStyle(CustomColors.darkBrownColor)
                            .padding(.top, 48)
                    } else if currentValue < goalValue {
                        Text(thirdTrackerText)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .foregroundStyle(CustomColors.darkBrownColor)
                            .padding(.top, 48)
                    } else {
                        Text(fourthTrackerText)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .foregroundStyle(CustomColors.darkBrownColor)
                            .padding(.top, 48)
                    }
                } else {
                    Text(trackerText)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .padding(.top, 48)
                    ButtonView(title: "Настроить", isButtonEnable: true) {
                        mainScreenCoordinator?.setUpTracker()
                    }
                    .padding(.top, 16)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MyProgress(goalValue: 10, currentValue: 4)
}
