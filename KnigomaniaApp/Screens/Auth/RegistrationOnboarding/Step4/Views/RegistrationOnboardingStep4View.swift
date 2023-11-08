//
//  RegistrationOnboardingStep4View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI
import PhotosUI

struct RegistrationOnboardingStep4View: View {
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	@State private var showImagePicker: Bool = false
	@State private var image = Image("PersonImage")
	@State private var inputImage: UIImage?
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0){
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, 20)
				Text("Выберите аватар для своего профиля")
					.modifier(RegularTextModifier())
					.padding(.top, 32)
				ZStack{
					Circle()
						.foregroundStyle(CustomColors.lightBrownColor)
						.frame(width: 167, height: 167)
					image
						.profileImageModifier(isChosen: inputImage != nil)
					ZStack{
						Circle()
							.frame(width: 27, height: 27)
							.foregroundStyle(CustomColors.brownColor)
						Image("pencil")
					}
					.offset(x: 167 / 3, y: 167 / 3)
					.opacity(inputImage == nil ? 1 : 0)
				}
				.padding(.top, 32)
				.onTapGesture {
					showImagePicker = true
				}
				.onChange(of: inputImage) { _ in
					loadImage()
				}
				.sheet(isPresented: $showImagePicker, content: {
					ImagePickerRegistration(image: $inputImage)
				})
				
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
	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
	}
}

#Preview {
	RegistrationOnboardingStep4View()
}
