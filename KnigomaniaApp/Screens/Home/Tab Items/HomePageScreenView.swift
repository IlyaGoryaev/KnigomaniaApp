//
//  HomePageScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct HomePageScreenView: View {
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
                            Image("notificationIcon")
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
                Spacer()
            }
        }
    }
}

#Preview {
    HomePageScreenView()
}
