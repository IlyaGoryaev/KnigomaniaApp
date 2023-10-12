import SwiftUI
import Combine

struct TextFieldTime: View{
	
	private(set) var firstEdge: Int
	private(set) var seconfEdge: Int
	@Binding private(set) var timeInterval: String
	@Binding private(set) var correctValue: Bool
	@Binding private(set) var strokeColor: Color
	
	
	var body: some View{
		TextField("", text: $timeInterval)
			.onReceive(Just(timeInterval), perform: { newValue in
				correctValue = Int(timeInterval) ?? 0 >= firstEdge && Int(timeInterval) ?? 0 <= seconfEdge
				print(newValue)
			})
			.tint(CustomColors.darkBrownColor)
			.font(.system(size: 24, weight: .semibold))
			.keyboardType(.numberPad)
			.multilineTextAlignment(.center)
			.foregroundStyle(CustomColors.darkBrownColor)
			.padding(.horizontal, 10)
			.padding(.vertical, 10)
			.background(Color.white)
			.frame(width: 52)
			.clipShape(RoundedRectangle(cornerRadius: 10))
			.onTapGesture {
				withAnimation {
					strokeColor = CustomColors.darkBrownColor
				}
			}
	}
	
}
