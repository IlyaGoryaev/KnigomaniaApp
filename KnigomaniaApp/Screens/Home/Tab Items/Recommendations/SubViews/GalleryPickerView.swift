//
//  GalleryPickerView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 27/10/23.
//

import SwiftUI

struct GalleryPickerView: View {
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
                    GalleryPickerButtonView()
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    GalleryPickerView()
}
