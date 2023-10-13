//
//  RegistrationOnboardingStep4View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct RegistrationOnboardingStep4View: View {
	
	var applicationCoordinator: ApplicationCoordinator?
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
				NavBar(title: "Регистрация") {
					applicationCoordinator?.backAction()
				}
				.padding(.top, 20)
				Text("Выберите аватар для своего профиля")
					.modifier(RegularTextModifier())
					.padding(.top, 20)
				CharacterView()
				ButtonView(title: "Продолжить", isButtonEnable: true) {
					applicationCoordinator?.openStep5()
				}
				Spacer()
			}
		}
	}
}

struct CharacterView: View{
	
	var body: some View{
		
		TabView {
			ForEach(0..<3){ _ in
				VStack{
					ZStack{
						Circle()
							.foregroundStyle(Color.white)
							.frame(width: 167, height: 167)
							.overlay {
								Image("RegistrationStep4ImageView")
									.resizable()
									.frame(width: 167, height: 167)
							}
					}
					Text("Мечтатель")
						.foregroundStyle(CustomColors.brownColor)
						.font(.system(size: 20, weight: .medium))
						.padding(.top, 24)
					Text("Проводит вечера за любимой книгой и горячей чашечкой чая. Обожает читать о путешествиях, погружается в любовные романы с головой.")
						.modifier(RegularTextModifier())
						.lineSpacing(10)
						.padding(.top, 16)
				}
			}
		}
		.tabViewStyle(PageTabViewStyle())
		.onAppear {
			setupAppearance()
		}
		.frame(height: 440)
	}
	
	
	func setupAppearance() {
		UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(CustomColors.brownColor)
		UIPageControl.appearance().pageIndicatorTintColor = UIColor(CustomColors.brownColor).withAlphaComponent(0.2)
	}
}

#Preview {
	RegistrationOnboardingStep4View()
}
