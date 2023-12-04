import SwiftUI

struct RegistrationOnboardingStep3View: RegistrationOnboardingViewProtocol {
	
	// MARK: Dependencies
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	// MARK: View
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero) {
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, Sizes.Padding.large)
				Text(TextTitles.RegOnBoarding3.setGoals.rawValue)
					.modifier(HeadlineTextModifier())
					.padding(.horizontal, Sizes.Padding.normal)
					.padding(.top, Sizes.Padding.large)
				Button(action: {
					applicationCoordinator?.logIn()
				}, label: {
					HStack(spacing: Sizes.Padding.small) {
						Text(TextTitles.RegOnBoarding3.skip.rawValue)
						Image(systemName: ImageNames.chevronRight.rawValue)
					}
					.foregroundStyle(CustomColors.brownColor)
					.font(.system(size: 14, weight: .semibold))
				})
				.padding(.top, Sizes.Padding.large)
				ButtonView(title: .setup, isButtonEnable: true){
					applicationCoordinator?.setUpTracker()
				}
				.padding(.top, Sizes.Padding.small)
				Spacer()
			}
			
		}
	}
}

// MARK: Preview

#Preview {
	RegistrationOnboardingStep3View()
}
