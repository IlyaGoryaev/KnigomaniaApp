import SwiftUI
import Combine

struct SetupTrackerStep2View: View {
	
	weak var trackerCoordinator: TrackerCoordinator?
	
	@State var hours: String = ""
	@State var minutes: String = ""
	@State var strokeColor: Color = .white
	@State var hoursCorrectValue: Bool = true
	@State var minutesCorrectValue: Bool = true
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
				NavBar(title: "Настройка трекера") {
					trackerCoordinator?.backAction()
				}
				.padding(.top, 20)
				Text("Сколько времени вы тратите в день на чтение?")
					.font(.system(size: 24, weight: .bold))
					.foregroundStyle(CustomColors.darkBrownColor)
					.multilineTextAlignment(.center)
					.padding(.top, 40)
					.padding(.horizontal, 16)
				Text("Введите целое число")
					.padding(.top, 32)
					.foregroundStyle(hoursCorrectValue && minutesCorrectValue ?
									 CustomColors.brownColor : Color.red)
				timeInput
					.padding(.top, 19)
				ButtonView(title: "Продолжить", isButtonEnable: isButtonEnable()) {
					trackerCoordinator?.openStep3()
					strokeColor = .white
				}
				.padding(.top, 32)
				Spacer()
			}
		}
	}
	
	var timeInput: some View{
		HStack(spacing: 24){
			HStack{
				TextFieldTime(firstEdge: 0, seconfEdge: 23, timeInterval: $hours, correctValue: $hoursCorrectValue, strokeColor: $strokeColor)
					.overlay {
						RoundedRectangle(cornerRadius: 10)
							.stroke(hoursCorrectValue && minutesCorrectValue ?
									strokeColor : Color.red)
					}
				Text("часов")
					.foregroundStyle(CustomColors.brownColor)
			}
			HStack{
				TextFieldTime(firstEdge: 0, seconfEdge: 59, timeInterval: $minutes, correctValue: $minutesCorrectValue, strokeColor: $strokeColor)
					.overlay {
						RoundedRectangle(cornerRadius: 10)
							.stroke(hoursCorrectValue && minutesCorrectValue ?
									strokeColor : Color.red)
					}
				Text("минут")
					.foregroundStyle(CustomColors.brownColor)
			}
		}
	}
	
	func isButtonEnable() -> Bool{
		(Int(hours) != nil) && (Int(minutes) != nil) && hoursCorrectValue && minutesCorrectValue
	}
}

#Preview {
	SetupTrackerStep2View()
}
