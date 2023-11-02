//
//  ImagePickerRegistration.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 01.11.2023.
//

import SwiftUI
import PhotosUI

struct ImagePickerRegistration: UIViewControllerRepresentable {
	
	@Binding var image: UIImage?
	
	func makeUIViewController(context: Context) -> some UIViewController {
		
		var config = PHPickerConfiguration()
		config.filter = .images
		let picker = PHPickerViewController(configuration: config)
		picker.delegate = context.coordinator
		return picker
		
	}
	
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
		
	}
	
	func makeCoordinator() -> ImageCoordinator {
		ImageCoordinator(self)
	}
}

class ImageCoordinator: NSObject, PHPickerViewControllerDelegate {
	
	let parent: ImagePickerRegistration
	
	init(_ parent: ImagePickerRegistration) {
		self.parent = parent
	}
	
	
	func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
		picker.dismiss(animated: true)
		
		guard let provider = results.first?.itemProvider else { return }
		
		if provider.canLoadObject(ofClass: UIImage.self) {
			provider.loadObject(ofClass: UIImage.self) { image, _ in
				self.parent.image = image as? UIImage
			}
		}
		
	}
}
