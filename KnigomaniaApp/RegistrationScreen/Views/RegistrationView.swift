//
//  RegistrationView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 14.10.2023.
//

import SwiftUI

struct RegistrationView: View {
	
	weak var entryCoordinator: EntryCoordinator?
	
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			ButtonView(title: "Регистрация", isButtonEnable: true) {
				entryCoordinator?.startRegistrationOnboarding()
			}
		}
    }
}

#Preview {
    RegistrationView()
}
