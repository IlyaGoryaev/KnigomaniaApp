//
//  RegistrationOnBoardingStep2View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 29.09.2023.
//

import SwiftUI

struct RegistrationOnBoardingStep2View: RegistrationOnboardingViewProtocol {
	
	// MARK: Dependencies
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	// MARK: Properties
	
	var genres = Genre.allValues
	@State var numberOfGenresChosen: Int = 0
	
	// MARK: View
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero.rawValue){
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				.padding(.bottom, Sizes.Padding.normal.rawValue)
				VStack{
					ScrollView{
						Text(TextTitles.RegOnBoarding2.whatToRead.rawValue)
							.modifier(RegularTextModifier())
							.padding(.top, Sizes.Padding.normal.rawValue)
						Text(TextTitles.RegOnBoarding2.chooseGenre.rawValue)
							.font(.system(size: 14))
							.foregroundStyle(CustomColors.brownColor)
						GenreSelection(tags: genres, numberOfGenresChosen: $numberOfGenresChosen)
							.padding(.horizontal, Sizes.Padding.normal.rawValue)
							.padding(.top, Sizes.Padding.normal.rawValue)
					}
				}
				ButtonView(title: .continuation, isButtonEnable: isButtonEnable()){
					applicationCoordinator?.route(view: .step3)
				}
				.padding(.top, Sizes.Padding.normal.rawValue)
				Spacer()
			}
			
		}
	}
	
	// MARK: Actions
	
	func isButtonEnable() -> Bool{
		numberOfGenresChosen >= 3
	}
}

// MARK: Preview

#Preview {
	RegistrationOnBoardingStep2View()
}
