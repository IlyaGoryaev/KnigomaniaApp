//
//  MainScreen.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.10.2023.
//

import SwiftUI

struct MainScreen: View {
	
	var mainScreenCoordinator: MainCoordinator?
	
	@State private var isShown: Bool = true
	
    var body: some View {
		ZStack{
			ZStack{
				CustomColors.background.ignoresSafeArea()
				Text("Main screen")
					.foregroundStyle(CustomColors.darkBrownColor)
					.font(.headline)
			}
			.blur(radius: isShown ? 4 : 0)
			
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

#Preview {
    MainScreen()
}
