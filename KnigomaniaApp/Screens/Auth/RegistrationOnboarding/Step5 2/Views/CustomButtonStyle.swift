import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle{
	
	@Binding private(set) var isPressed: Bool
	@State private(set) var scaleEffect: CGFloat = 1
	
	func makeBody(configuration: Configuration) -> some View {
		if configuration.isPressed{
			withAnimation {
				configuration.label
					.modifier(SelectedGenre())
					.scaleEffect(scaleEffect)
			}
		} else {
			withAnimation {
				configuration.label
					.modifier(UnselectedGenre())
					.scaleEffect(scaleEffect)
			}
		}
	}
}
