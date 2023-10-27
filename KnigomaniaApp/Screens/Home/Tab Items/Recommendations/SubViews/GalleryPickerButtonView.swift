//
//  GalleryPickerButtonView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 27/10/23.
//

import SwiftUI

struct GalleryPickerButtonView: View {
    private(set) var action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
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
    }
}

#Preview {
    GalleryPickerButtonView() {}
}
