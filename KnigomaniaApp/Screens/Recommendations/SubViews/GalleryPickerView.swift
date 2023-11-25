//
//  GalleryPickerView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 27/10/23.
//

import SwiftUI
import PhotosUI

struct GalleryPickerView: View {
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    @State private var isImageSelected = false
    @State private var image = Image("")
    
    var body: some View {
        VStack {
            HStack {
                Text("Обложка")
                    .foregroundColor(CustomColors.darkBrownColor)
                    .font(.system(size: 14, weight: .regular))
                Spacer()
            }
            .padding(.horizontal, 16)
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 143)
                    .background(Color.white)
                    .cornerRadius(10)
                HStack {
					ActionButton(title: "Выбрать из галереи", padding: Sizes.Buttons.ActionButtonPadding.large.rawValue, actionType: .approveAction)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(image: $inputImage)
                    }
                }
            }
            .padding(.horizontal, 16)
            if isImageSelected {
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 83, height: 109)
                        .background(
                            ZStack {
                                image
                                    .bookImageModifier(isChosen: inputImage != nil)
                                VStack {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            isImageSelected = false
                                            inputImage = nil
                                        }, label: {
                                            Image("closeicon")
                                        })
                                    }
                                    .padding(.trailing, 8)
                                    Spacer()
                                }
                                .padding(.top, 8)
                            }
                        )
                        .cornerRadius(8)
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 16)
            }
        }
        .onChange(of: inputImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    private func requestAuthorizationForPhotos() {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized, .limited:
                showImagePicker = true
            case .denied, .notDetermined:
                break
            case .restricted:
                break
            @unknown default:
                break
            }
        }
    }
    
    private func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        isImageSelected = true
    }
}

#Preview {
    GalleryPickerView()
}
