//
//  HomeScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var selection = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                HomePageScreenView()
                    .tag(0)
                LibraryScreenView()
                    .tag(1)
                ScanScreenView()
                    .tag(2)
                SettingsScreenView()
                    .tag(3)
            }
            ZStack {
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selection = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, isActive: (selection == item.rawValue))
                        }
                    }
                }
            }
            .frame(height: 96)
            .background(CustomColors.brownColor.opacity(0.75))
            .clipShape(
                .rect(
                    topLeadingRadius: 8,
                    topTrailingRadius: 8
                )
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension HomeScreenView {
    func CustomTabItem(imageName: String, isActive: Bool) -> some View {
        HStack {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .white : CustomColors.lightColor)
                .frame(width: 30, height: 30)
            Spacer()
        }
    }
}

#Preview {
    HomeScreenView()
}
