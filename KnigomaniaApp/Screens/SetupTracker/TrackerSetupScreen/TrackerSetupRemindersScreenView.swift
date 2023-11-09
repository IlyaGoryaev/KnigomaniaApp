//
//  TrackerSetupRemindersScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 3/10/23.
//

import SwiftUI

struct TrackerSetupRemindersScreenView: View {
	
	weak var setupReminderCoordinator: SetUpReminderTrackerCoordinator?
	
    @State private var isReminderEnabled = false
    @State private var showDaySelection = false
    @State private var selectedDays: [String] = []
	
	@State private var isDatesShown: Bool = false
	@State private var isTimeShown: Bool = false
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Настроить напоминания")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(CustomColors.darkBrownColor)
                    .padding(.top, 32)
                HStack {
                    Toggle(isOn: $isReminderEnabled) {
                        Text("Напоминания")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: CustomColors.brownColor))
                }
                .padding(.horizontal, 16)
                .padding(.top, 40)
                HStack {
                    Text("Когда напоминать")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(CustomColors.darkBrownColor)
                    Spacer()
                    Button(action: {
						withAnimation {
							isDatesShown = true
						}
                        showDaySelection.toggle()
                    }) {
                        Text("Выбрать дни")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(CustomColors.brownColor)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 32)
                HStack {
                    Text("Время")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(CustomColors.darkBrownColor)
                    Spacer()
					Button(action: {
						withAnimation {
							isTimeShown = true
						}
						showDaySelection.toggle()
					}) {
						Text("12:00")
							.font(.system(size: 16, weight: .semibold))
							.foregroundColor(CustomColors.brownColor)
					}
					
                }
                .padding(.horizontal, 16)
                .padding(.top, 32)
				ButtonView(title: .complete, isButtonEnable: true) {
					setupReminderCoordinator?.finishSetupReminder()
                }
                .padding(.top, 32)
                Spacer()
            }
			.blur(radius: isDatesShown || isTimeShown ? 3.0 : 0.0)
			DaySelectionModalView(isShown: $isDatesShown)
				.opacity(isDatesShown ? 1 : 0)
			TimeSelectionModalView(timeIsShown: $isTimeShown)
				.opacity(isTimeShown ? 1 : 0)
        }
    }
}

#Preview {
    TrackerSetupRemindersScreenView()
}
