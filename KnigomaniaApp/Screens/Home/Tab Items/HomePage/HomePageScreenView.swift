//
//  HomePageScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct HomePageScreenView: View {
    @State private var selection = 0
    @Namespace private var lineAnimation
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Привет, Мария!")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(CustomColors.darkBrownColor)
                    Spacer()
                    HStack(spacing: 8) {
                        Button(action: {
                            
                        }, label: {
                            Image("notificationicon")
                        })
                        Image("")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 2))
                    }
                }
                .padding(.top, 29)
                .padding(.horizontal, 16)
                HStack(spacing: 29) {
                    Text("Мой прогресс")
                        .foregroundColor(CustomColors.darkBrownColor)
                        .font(.system(size: 14))
                        .fontWeight(selection == 0 ? .semibold : .regular)
                        .onTapGesture {
                            withAnimation(.default) {
                                selection = 0
                            }
                        }
                    Text("Читаю сейчас")
                        .foregroundColor(CustomColors.darkBrownColor)
                        .font(.system(size: 14))
                        .fontWeight(selection == 1 ? .semibold : .regular)
                        .onTapGesture {
                            withAnimation(.default) {
                                selection = 1
                            }
                        }
                    Spacer()
                }
                .padding(.leading, 21)
                .padding(.top, 24)
                .edgesIgnoringSafeArea(.trailing)
                HStack {
                    Rectangle()
                        .frame(width: 109, height: 2)
                        .foregroundColor(CustomColors.yellowColor)
                        .matchedGeometryEffect(id: "line", in: lineAnimation)
                        .offset(x: CGFloat(selection) * (UIScreen.main.bounds.width / 3))
                        .animation(.default, value: selection)
                    Spacer()
                }
                .padding(.leading, 16)
                TabView(selection: $selection) {
                    StatisticsView()
                        .tag(0)
                    CurrentLibraryView()
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                Spacer()
            }
        }
    }
}

#Preview {
    HomePageScreenView()
}
