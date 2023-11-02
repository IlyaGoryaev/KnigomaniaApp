//
//  ImageExtension.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 2/11/23.
//

import SwiftUI

extension Image {
    func profileImageModifier(isChosen: Bool) -> some View {
        self
            .resizable()
            .frame(width: isChosen ? 167 : 80, height: isChosen ? 167 : 80)
            .clipShape(Circle())
    }
    
    func bookImageModifier(isChosen: Bool) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 83, height: 109)
            .clipped()
    }
}
