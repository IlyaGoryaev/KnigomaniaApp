//
//  RegistrationStep5View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 29.09.2023.
//

import SwiftUI

struct RegistrationStep5View: View {
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	var genres = Genre.allValues
	@State var numberOfGenresChosen: Int = 0
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, 20)
				VStack{
					ScrollView{
						Text("Что вы любите читать?")
							.modifier(RegularTextModifier())
							.padding(.top, 20)
						Text("Выберите как минимум 3 жанра")
							.font(.system(size: 14))
							.foregroundStyle(CustomColors.brownColor)
						GenreSelection(tags: genres, numberOfGenresChosen: $numberOfGenresChosen)
							.padding(.horizontal, 16)
							.padding(.top, 24)
					}
				}
				ButtonView(title: "Продолжить", isButtonEnable: isButtonEnable()){
					applicationCoordinator?.openStep6()
				}
				.padding(.top, 16)
				Spacer()
			}
			
		}
	}
	
	func isButtonEnable() -> Bool{
		numberOfGenresChosen >= 3
	}
}

#Preview {
	RegistrationStep5View()
}
