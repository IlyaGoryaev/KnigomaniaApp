//
//  TrackerSetupConfirmationScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/10/23.
//

import SwiftUI

struct TrackerSetupConfirmationScreenView: View {
	
	weak var setupReminderCoordinator: SetUpReminderTrackerCoordinator?
	
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("trackerscreenimage")
                    .padding(.top, 21)
                VStack(spacing: 10) {
                    Text("Вперёд в Книгоманию!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                    Text("Настало время воплощать задуманное в жизнь - осталось нажать на кнопку ниже!")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                }
                .padding(.top, 64)
                ButtonView(title: "Поехали", isButtonEnable: true) {
					setupReminderCoordinator?.logIn()
                }
                .padding(.top, 32)
                Spacer()
            }
        }
    }
}

#Preview {
    TrackerSetupConfirmationScreenView()
}
