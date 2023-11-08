//
//  RegistrationOnboardingStep3View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct RegistrationOnboardingStep3View: View {
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
                NavBar(title: .registrationTitle) {
					
				}
				.padding(.top, 20)
				Text("Ваш адрес электронной почты подтвержден!")
					.modifier(HeadlineTextModifier())
					.padding(.top, 40)
					.padding(.horizontal, 35)
				ButtonView(title: "Продолжить", isButtonEnable: true){
					applicationCoordinator?.openStep4()
				}
				.padding(.top, 32)
				Spacer()
			}
		}
	}
}

#Preview {
	RegistrationOnboardingStep3View()
}
