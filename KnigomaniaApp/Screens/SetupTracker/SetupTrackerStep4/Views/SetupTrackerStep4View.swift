import SwiftUI

struct SetupTrackerStep4View: View {
	
	
	var trackerCoordinator: TrackerCoordinator?
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
				NavBar(title: "") {
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
					.foregroundStyle(CustomColors.brownColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 16)
					.multilineTextAlignment(.leading)
				Text("Подключите напоминания, так вам будет удобнее отслеживать свой прогресс по чтению")
					.foregroundStyle(CustomColors.brownColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 16)
					.padding(.top, 8)
					.lineSpacing(10)
					.multilineTextAlignment(.leading)
				Button(action: {
					
				}, label: {
					HStack{
						Text("Пропустить")
						Image(systemName: "chevron.right")
					}
					.foregroundStyle(CustomColors.brownColor)
					.font(.system(size: 14, weight: .semibold))
				})
				.padding(.top, 24)
				ButtonView(title: "Настроить напоминания", isButtonEnable: true){
					
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