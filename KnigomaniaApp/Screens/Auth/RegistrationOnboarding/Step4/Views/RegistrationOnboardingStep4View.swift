//
//  RegistrationOnboardingStep4View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct RegistrationOnboardingStep4View: View {
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	@State private var isPhotoChosen: Bool = true
	@State private var image = UIImage()
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0){
				NavBar(title: "Регистрация") {
					applicationCoordinator?.backAction()
				}
				.padding(.top, 20)
				Text("Выберите аватар для своего профиля")
					.modifier(RegularTextModifier())
					.padding(.top, 32)
				if isPhotoChosen{
					Image(uiImage: image)
						.resizable()
						.foregroundStyle(CustomColors.lightBrownColor)
						.frame(width: 167, height: 167)
						.padding(.top, 32)
				} else {
					ZStack{
						Circle()
							.foregroundStyle(CustomColors.lightBrownColor)
							.frame(width: 167, height: 167)
						Image("PersonImage")
						ZStack{
							Circle()
								.frame(width: 27, height: 27)
								.foregroundStyle(CustomColors.brownColor)
							Image("pencil")
						}
						.offset(x: 167 / 3, y: 167 / 3)
					}
					.padding(.top, 32)
				}
				
				VStack{
					Button(action: {
						applicationCoordinator?.openStep5()
					}, label: {
						HStack(spacing: 8){
							Text("Пропустить")
							Image(systemName: "chevron.right")
						}
						.foregroundStyle(CustomColors.brownColor)
						.font(.system(size: 14, weight: .semibold))
					})
					ButtonView(title: "Продолжить", isButtonEnable: true) {
						applicationCoordinator?.openStep5()
					}
				}
				.padding(.top, 32)
				
				Spacer()
			}
		}
	}
}

//struct ImagePicker: UIViewControllerRepresentable{
//	
//	var sourceType = UIImagePickerController.SourceType.ph
//
//	func makeUIViewController(context: Context) -> some UIViewController {
//		
//		let imagePicker = UIImagePickerController()
//		imagePicker.allowsEditing = false
//		imagePicker.sourceType = sourceType
//		
//		return imagePicker
//		
//	}
//	
//	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//		
//	}
//	
//	
//}

#Preview {
	RegistrationOnboardingStep4View()
}
