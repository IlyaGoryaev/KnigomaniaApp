import SwiftUI
import Combine

struct SetupTrackerStep1View: View {
	
	weak var trackerCoordinator: TrackerCoordinator?
	
	@State private var amountOfBooks: Double = 0
	@State private var amountOfBooksString: String = ""
	@State private var strokeColor: Color = .white
	@State private var isSliderActive: Bool = false
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
                NavBar(title: .setupTrackerTitle) {
					
				}
				.padding(.top, 20)
				Text("Сколько книг планируете прочитать за год?")
					.modifier(HeadlineTextModifier())
					.padding(.top, 40)
					.padding(.horizontal, 8)
				Text("Введите целое число от 1 до 100")
					.font(.system(size: 16))
					.padding(.top, 16)
					.foregroundStyle(Int(amountOfBooksString) ?? 0 <= 100 && Int(amountOfBooksString) ?? 0 >= 0 ? CustomColors.brownColor : Color.red)
				numberTextField
				slider
				ButtonView(title: .continuation, isButtonEnable: isButtonEnable(), action: {
					trackerCoordinator?.openStep2()
					strokeColor = .white
				})
				.padding(.top, 32)
				Spacer()
			}
		}
	}
	
	var slider: some View{
		Slider(value: $amountOfBooks, in: 0...100, step: 10){ newValue in
			isSliderActive = newValue
			amountOfBooksString = Int(amountOfBooks).description
		}
		.onReceive(Just(amountOfBooks), perform: { newValue in
			if isSliderActive{
				amountOfBooksString = Int(amountOfBooks).description
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
		NumberTextField(text: amountOfBooksString, strokeColor: $strokeColor, amountOfElementsString: $amountOfBooksString, amountOfElemnts: $amountOfBooks, firstEdge: 0, secondEdge: 100)
			.padding(.top, 18)
			.frame(width: 100)
	}
	
	func setupAppearance() {
		UISlider.appearance().thumbTintColor = UIColor(CustomColors.darkBrownColor)
		UISlider.appearance().maximumTrackTintColor = UIColor(CustomColors.beigeColor)
	}
	
	func isButtonEnable() -> Bool{
		Int(amountOfBooksString) != nil && Int(amountOfBooksString)! > 0 && Int(amountOfBooksString)! < 101
	}
}
#Preview {
	SetupTrackerStep1View()
}
