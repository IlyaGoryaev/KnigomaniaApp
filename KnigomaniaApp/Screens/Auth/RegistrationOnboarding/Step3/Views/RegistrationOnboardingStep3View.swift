import SwiftUI

struct RegistrationOnboardingStep3View: RegistrationOnboardingViewProtocol {
	
	// MARK: Dependencies
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	// MARK: View
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero.rawValue) {
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				Text(TextTitles.RegOnBoarding6.setGoals.rawValue)
					.modifier(HeadlineTextModifier())
					.padding(.horizontal, Sizes.Padding.normal.rawValue)
					.padding(.top, Sizes.Padding.large.rawValue)
				Button(action: {
					applicationCoordinator?.logIn()
				}, label: {
					HStack(spacing: Sizes.Padding.small.rawValue) {
						Text(TextTitles.RegOnBoarding6.skip.rawValue)
						Image(systemName: ImageNames.chevronRight.rawValue)
					}
					.foregroundStyle(CustomColors.brownColor)
					.font(.system(size: 14, weight: .semibold))
				})
				.padding(.top, Sizes.Padding.large.rawValue)
				ButtonView(title: .setup, isButtonEnable: true){
					applicationCoordinator?.setUpTracker()
				}
				.padding(.top, Sizes.Padding.small.rawValue)
				Spacer()
			}
			
		}
	}
}

// MARK: Preview

#Preview {
	RegistrationOnboardingStep3View()
}
