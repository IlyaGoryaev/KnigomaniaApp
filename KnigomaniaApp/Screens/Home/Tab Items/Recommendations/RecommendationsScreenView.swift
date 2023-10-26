//
//  RecommendationsScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct RecommendationsScreenView: View {
    @State private var searchText = ""
    weak var recommendationsCoordinator: RecommendationsCoordinator?
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                SearchBookTextField(text: $searchText)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                ScrollView {
                    VStack {
                        SectionNameView(title: "Бестселлеры", action: {})
                            .padding(.top, 32)
                    }
                    VStack {
                        SectionNameView(title: "Новинки", action: {})
                            .padding(.top, 24)
                    }
                    VStack {
                        SectionNameView(title: "Экранизации", action: {})
                            .padding(.top, 24)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    RecommendationsScreenView()
}
