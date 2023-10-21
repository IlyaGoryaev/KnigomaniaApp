//
//  HomeScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct HomeScreenView: View {
	
	weak var mainScreenCoordinator: MainCoordinator?
	
	@State private var isShown: Bool = true
	
    @State private var selection = 0
    
    var body: some View {
		ZStack{
			VStack(spacing: 0) {
				TabView(selection: $selection) {
					HomePageScreenView(mainScreenCoordinator: mainScreenCoordinator)
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
			.blur(radius: isShown ? 3 : 0)
			.edgesIgnoringSafeArea(.bottom)
			
			CustomActivityIndicator()
				.opacity(isShown ? 1 : 0)
		}
		.onAppear(perform: {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
				isShown = false
			}
		})

		
    }
}

extension HomeScreenView {
    func CustomTabItem(imageName: String, isActive: Bool) -> some View {
        HStack {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
				.foregroundColor(isActive ? .white : CustomColors.greyColor)
                .frame(width: 30, height: 30)
            Spacer()
        }
    }
}

#Preview {
    HomeScreenView()
}
