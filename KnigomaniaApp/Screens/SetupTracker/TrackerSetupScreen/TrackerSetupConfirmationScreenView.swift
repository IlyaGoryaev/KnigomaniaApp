//
//  TrackerSetupConfirmationScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/10/23.
//

import SwiftUI

struct TrackerSetupConfirmationScreenView: View {
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
                Button(action: {
                    
                }) {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(CustomColors.yellowColor)
                        .cornerRadius(10)
                        .overlay(
                            Text("Поехали")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        )
                }
                .padding(.top, 32)
                .padding(.horizontal, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    TrackerSetupConfirmationScreenView()
}
