//
//  ImagePicker.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 27/10/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
}

class ImagePickerCoordinator: NSObject, PHPickerViewControllerDelegate {
    let parent: ImagePicker
    
    init(_ parent: ImagePicker) {
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
