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
				Image("SetupTracketStep4")
					.resizable()
					.frame(height: 400)
					.padding(.top, 32)
				Text("Настроить напоминания")
					.padding(.top, 20)
					.font(.system(size: 24, weight: .bold))
					.foregroundStyle(CustomColors.darkBrownColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 16)
					.multilineTextAlignment(.leading)
				Text("Включи напоминания, чтобы эффективнее двигаться к цели.")
					.foregroundStyle(CustomColors.brownColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 16)
					.padding(.top, 8)
					.lineSpacing(10)
					.multilineTextAlignment(.leading)
				Button(action: {
					trackerCoordinator?.logIn()
				}, label: {
					HStack{
						Text("Пропустить")
						Image(systemName: "chevron.right")
					}
					.foregroundStyle(CustomColors.darkBrownColor)
					.font(.system(size: 14, weight: .semibold))
				})
				.padding(.top, 24)
				ButtonView(title: "Настроить напоминания", isButtonEnable: true){
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
