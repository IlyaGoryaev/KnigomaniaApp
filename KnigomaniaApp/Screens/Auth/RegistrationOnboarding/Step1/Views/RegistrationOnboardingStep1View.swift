//
//  RegistrationOnboardingStep4View.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI
import PhotosUI

struct RegistrationOnboardingStep1View: RegistrationOnboardingViewProtocol {
	
	// MARK: Dependencies
	
	weak var applicationCoordinator: RegistrationOnboardingCoordinator?
	
	// MARK: Properties
	
	@State private var showImagePicker: Bool = false
	@State private var image = Image("PersonImage")
	@State private var inputImage: UIImage?
	
	// MARK: View
	
	var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero) {
                NavBar(title: .registrationTitle) {
					applicationCoordinator?.backAction()
				}
				.padding(.top, Sizes.Padding.large)
				Text(TextTitles.RegOnBoarding1.setPhotoText.rawValue)
					.modifier(RegularTextModifier())
					.lineSpacing(Sizes.Padding.normal)
					.padding(.top, Sizes.Padding.large)
					.padding(.horizontal, Sizes.Padding.normal)
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
				.padding(.top, Sizes.Padding.large)
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
						applicationCoordinator?.route(view: .step2)
						print("Route")
					}, label: {
						HStack(spacing: Sizes.Padding.small){
							Text(TextTitles.RegOnBoarding1.skip.rawValue)
							Image(systemName: "chevron.right")
						}
						.foregroundStyle(CustomColors.brownColor)
						.font(.system(size: 14, weight: .semibold))
					})
					ButtonView(title: .continuation, isButtonEnable: true) {
						applicationCoordinator?.route(view: .step2)
					}
				}
				.padding(.top, Sizes.Padding.large)
				
				Spacer()
			}
		}
	}
	
	// MARK: Actions
	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
	}
}

// MARK: Preview

#Preview {
	RegistrationOnboardingStep1View()
}
