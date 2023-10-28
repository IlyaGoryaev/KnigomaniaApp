//
//  GalleryPickerButtonView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 27/10/23.
//

import SwiftUI
import Photos

struct GalleryPickerButtonView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var hasAccess = false
    
    var body: some View {
        Button(action: {
            if !hasAccess {
                let status = PHPhotoLibrary.authorizationStatus()
                switch status {
                case .authorized:
                    hasAccess = true
                    showSheet = true
                case .notDetermined:
                    PHPhotoLibrary.requestAuthorization { newStatus in
                        if newStatus == .authorized {
                            hasAccess = true
                            showSheet = true
                        }
                    }
                case .denied:
                    PHPhotoLibrary.requestAuthorization { newStatus in
                        if newStatus == .authorized {
                            hasAccess = true
                            showSheet = true
                        }
                    }
                default:
                    print("authorizationStatus: \(status.rawValue)")
                }
            } else {
                showSheet = true
            }
        }, label: {
            Text("Выбрать из галереи")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .background(CustomColors.darkBrownColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 72)
        })
        .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}

#Preview {
    GalleryPickerButtonView()
}
