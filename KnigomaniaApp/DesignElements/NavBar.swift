//
//  RegistrationNavBar.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct NavBar: View {
	
	var title: String
	
	var action: () -> ()
	
	var body: some View {
		ZStack(alignment: .leading){
			HStack{
				Text(title)
					.font(.system(size: 20, weight: .semibold))
					.foregroundStyle(CustomColors.darkBrownColor)
					.frame(maxWidth: .infinity)
			}
			Button(action: {
				action()
			}, label: {
				Image(systemName: "chevron.left")
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 18)
			})
		}
	}
}

#Preview {
	NavBar(title: "Регистрация"){
		print("registration")
	}
}



