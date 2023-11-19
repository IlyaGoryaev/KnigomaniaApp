import SwiftUI

struct SetupTrackerStep4View: View {
	
	weak var trackerCoordinator: TrackerCoordinator?
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
                NavBar(title: .emptyTitle) {
					trackerCoordinator?.backAction()
				}
				.padding(.top, 20)
				Image("trackersetupscreenimage1")
					.padding(.top, 31)
				Text("Настроить напоминания")
					.padding(.top, 68)
					.font(.system(size: 24, weight: .bold))
					.foregroundStyle(CustomColors.darkBrownColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 16)
					.multilineTextAlignment(.leading)
				Text("Включи напоминания, чтобы эффективнее двигаться к цели.")
					.foregroundStyle(CustomColors.brownColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 16)
					.padding(.top, 16)
					.lineSpacing(10)
					.multilineTextAlignment(.leading)
				Button(action: {
					trackerCoordinator?.logIn()
				}, label: {
					HStack{
						Text("Пропустить")
						Image(systemName: "chevron.right")
					}
					.foregroundStyle(CustomColors.greyColor)
					.font(.system(size: 14, weight: .regular))
				})
				.padding(.top, 32)
				ButtonView(title: .setupNotification, isButtonEnable: true){
					trackerCoordinator?.setUpReminder()
				}
				.padding(.top, 8)
				Spacer()
			}
		}
	}
}

#Preview {
	SetupTrackerStep4View()
}
