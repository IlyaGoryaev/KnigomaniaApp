import SwiftUI

struct RegistrationOnboardingStep6View: View {
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			//Main layer
			VStack{
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, 20)
				Text("Хотите настроить сейчас\n ваши цели по чтению?")
					.modifier(HeadlineTextModifier())
					.padding(.horizontal, 16)
					.padding(.top, 40)
				Button(action: {
					applicationCoordinator?.logIn()
				}, label: {
					HStack(spacing: 8){
						Text("Пропустить")
						Image(systemName: "chevron.right")
					}
					.foregroundStyle(CustomColors.brownColor)
					.font(.system(size: 14, weight: .semibold))
				})
				.padding(.top, 32)
				ButtonView(title: .setup, isButtonEnable: true){
					applicationCoordinator?.setUpTracker()
				}
				.padding(.top, 8)
				Spacer()
			}
			
		}
	}
}

#Preview {
	RegistrationOnboardingStep6View()
}
