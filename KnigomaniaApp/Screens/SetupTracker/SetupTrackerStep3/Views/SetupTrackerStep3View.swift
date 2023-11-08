import SwiftUI
import Combine

struct SetupTrackerStep3View: View {
	
	weak var trackerCoordinator: TrackerCoordinator?
	
	@State private var amountOfDays: Double = 0
	@State private var amountOfDaysString: String = ""
	@State private var strokeColor: Color = .white
	@State private var isSliderActive: Bool = false
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
                NavBar(title: .setupTrackerTitle) {
					trackerCoordinator?.backAction()
				}
				.padding(.top, 20)
				Text("Сколько дней в неделю вы готовы уделять чтению?")
					.modifier(HeadlineTextModifier())
					.padding(.top, 40)
					.padding(.horizontal, 8)
				Text("Введите целое число от 1 до 7")
					.font(.system(size: 16))
					.padding(.top, 16)
					.foregroundStyle(Int(amountOfDaysString) ?? 0 <= 7 && Int(amountOfDaysString) ?? 0 >= 0 ? CustomColors.brownColor : Color.red)
				numberTextField
				slider
				ButtonView(title: "Продолжить", isButtonEnable: isButtonEnable()){
					trackerCoordinator?.openStep4()
					strokeColor = .white
				}
				.padding(.top, 32)
				Spacer()
			}
			
		}
	}
	
	var slider: some View{
		Slider(value: $amountOfDays, in: 0...7, step: 0.5){ newValue in
			isSliderActive = newValue
			amountOfDaysString = Int(amountOfDays).description
		}
		.onReceive(Just(amountOfDays), perform: { newValue in
			if isSliderActive{
				amountOfDaysString = Int(amountOfDays).description
			}
		})
		.padding(.horizontal, 16)
		.padding(.top, 24)
		.tint(CustomColors.darkBrownColor)
		.onAppear{
			setupAppearance()
		}
	}
	
	var numberTextField: some View{
		NumberTextField(text: amountOfDaysString, strokeColor: $strokeColor, amountOfElementsString: $amountOfDaysString, amountOfElemnts: $amountOfDays, firstEdge: 0, secondEdge: 7)
			.padding(.top, 18)
			.frame(width: 100)
	}
	
	func setupAppearance() {
		UISlider.appearance().thumbTintColor = UIColor(CustomColors.darkBrownColor)
		UISlider.appearance().maximumTrackTintColor = UIColor(CustomColors.beigeColor)
	}
	
	func isButtonEnable() -> Bool{
		Int(amountOfDaysString) != nil && Int(amountOfDaysString)! > 0 && Int(amountOfDaysString)! < 8
	}
}

#Preview {
	SetupTrackerStep3View()
}
