//
//  DaySelectionModalView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/10/23.
//

import SwiftUI

struct DaySelectionModalView: View {
    @State private var days: [Day] = [
        Day(name: "Понедельник"),
        Day(name: "Вторник"),
        Day(name: "Среда"),
        Day(name: "Четверг"),
        Day(name: "Пятница"),
        Day(name: "Суббота"),
        Day(name: "Воскресенье")
    ]
    
    var body: some View {
        ZStack {
            CustomColors.background // temporary
                .edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 343, height: 470)
                    .background(.white)
                    .cornerRadius(16)
                    .overlay(
                        VStack {
                            Text("Когда напоминать")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(CustomColors.darkBrownColor)
                                .padding(.top, 24)
                            List($days) { $day in
                                HStack {
                                    Text(day.name)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(CustomColors.darkBrownColor)
                                    Spacer()
                                    if day.isSelected {
                                        Image("iconCheck")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    toggleSelection(for: $day)
                                }
                            }
                            .padding(.top, -24)
                            .padding(.horizontal, -16)
                            .scrollContentBackground(.hidden)
                            HStack {
                                Button(action: {
                                    
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
                            .padding(.vertical, 12)
                            Spacer()
                        }
                    )
            }
        }
    }
    
    private func toggleSelection(for day: Binding<Day>) {
        day.wrappedValue.isSelected.toggle()
    }
}

#Preview {
    DaySelectionModalView()
}
