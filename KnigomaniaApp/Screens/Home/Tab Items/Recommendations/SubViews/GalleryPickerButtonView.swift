//
//  GalleryPickerButtonView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 27/10/23.
//

import SwiftUI

struct GalleryPickerButtonView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var showAlert = false
    
    private let hasAllowedPhotoAccessKey = "hasAllowedPhotoAccess"
    
    var body: some View {
        Button(action: {
            showSheet = UserDefaults.standard.bool(forKey: hasAllowedPhotoAccessKey) ? true : false
//            showAlert = true
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
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(""),
                message: Text("Разрешить приложению доступ к фото на вашем устройстве?"),
                primaryButton: .destructive(
                    Text("Запретить"),
                    action: { showSheet = false }
                ),
                secondaryButton: .default(
                    Text("Разрешить"),
                    action: {
                        UserDefaults.standard.set(true, forKey: hasAllowedPhotoAccessKey)
                        showSheet = true
                    }
                )
            )
        }
    }
}

#Preview {
    GalleryPickerButtonView()
}
