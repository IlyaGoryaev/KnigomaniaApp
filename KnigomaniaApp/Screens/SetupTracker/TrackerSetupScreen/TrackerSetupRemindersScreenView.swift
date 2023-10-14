//
//  TrackerSetupRemindersScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 3/10/23.
//

import SwiftUI

struct TrackerSetupRemindersScreenView: View {
    @State private var isReminderEnabled = false
    @State private var showDaySelection = false
    @State private var selectedDays: [String] = []
    
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
                }
                .padding(.horizontal, 16)
                .padding(.top, 32)
                ButtonView(title: "Завершить", isButtonEnable: true) {
                    
                }
                .padding(.top, 32)
                Spacer()
            }
        }
    }
}

#Preview {
    TrackerSetupRemindersScreenView()
}
