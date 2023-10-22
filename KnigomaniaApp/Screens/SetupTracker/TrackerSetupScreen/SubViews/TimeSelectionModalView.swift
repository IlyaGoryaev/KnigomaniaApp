//
//  TimeSelectionModalView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/10/23.
//

import SwiftUI

struct TimeSelectionModalView: View {
	
	@Binding var timeIsShown: Bool
	
    @State private var selectedTime = Date()
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 343)
                .background(.white)
                .cornerRadius(16)
                .overlay(
                    VStack {
                        Text("Время")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(CustomColors.darkBrownColor)
                            .padding(.top, 24)
                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .colorMultiply(CustomColors.brownColor)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .environment(\.locale, Locale(identifier: "ru"))
                            .onAppear {
                                UIDatePicker.appearance().minuteInterval = 15
                            }
                            .padding(.top, 16)
                        HStack {
                            Button(action: {
								withAnimation {
									timeIsShown = false
								}
                            }) {
                                Rectangle()
                                    .frame(height: 48)
                                    .foregroundColor(CustomColors.brownColor)
                                    .opacity(0.25)
                                    .cornerRadius(10)
                                    .overlay(
                                        Text("Отмена")
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(CustomColors.darkBrownColor)
                                    )
                            }
                            Button(action: {
								withAnimation {
									timeIsShown = false
								}
                            }) {
                                Rectangle()
                                    .frame(height: 48)
                                    .foregroundColor(CustomColors.darkBrownColor)
                                    .cornerRadius(10)
                                    .overlay(
                                        Text("Выбрать")
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, -12)
                        Spacer()
                    }
                )
			Spacer()
        }
    }
}
