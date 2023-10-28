//
//  PickedImageView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 28/10/23.
//

import SwiftUI

struct PickedImageView: View {
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 83, height: 109)
                    .background(.black.opacity(0.1))
                    .background(
                        ZStack {
                            Image("")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 83, height: 109)
                                .clipped()
                            VStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        
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
}

#Preview {
    PickedImageView()
}
