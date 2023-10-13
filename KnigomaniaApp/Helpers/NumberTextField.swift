import SwiftUI
import Combine

struct NumberTextField: View {
	
	private(set) var text: String
	@Binding private(set) var strokeColor: Color
	@Binding private(set) var amountOfElementsString: String
	@Binding private(set) var amountOfElemnts: Double
	private(set) var firstEdge: Int
	private(set) var secondEdge: Int
	
	var body: some View{
		TextField(text: $amountOfElementsString) {
			Text(Int(text)?.description ?? "0")
				.foregroundStyle(((Int(text)?.description) == nil) ? CustomColors.brownColor :
									CustomColors.darkBrownColor)
		}
		.onSubmit {
			withAnimation{
				strokeColor = .white
			}
		}
		.tint(CustomColors.brownColor)
		.onReceive(Just(amountOfElementsString), perform: { newValue in
			amountOfElemnts = Double(Int(amountOfElementsString) ?? 0)
		})
		.keyboardType(.numberPad)
		.multilineTextAlignment(.center)
		.font(.system(size: 24, weight: .semibold))
		.foregroundStyle(CustomColors.brownColor)
		.padding(.vertical, 10)
		.padding(.horizontal, 10)
		.background(Color.white)
		.clipShape(RoundedRectangle(cornerRadius: 10))
		.overlay(content: {
			RoundedRectangle(cornerRadius: 10)
				.stroke(Int(amountOfElementsString) ?? 0 <= secondEdge && Int(amountOfElementsString) ?? 0 >= firstEdge ? strokeColor : Color.red , lineWidth: 1)
		})
		.onTapGesture {
			withAnimation{
				strokeColor = CustomColors.brownColor
			}
		}
		.padding(.horizontal, 17)
	}
}
