//
//  NotFoundView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct NotFoundView: View {
    weak var recommendationsCoordinator: RecommendationsCoordinator?
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Ничего не найдено")
                .foregroundColor(CustomColors.darkBrownColor)
                .font(.system(size: 16))
            ButtonView(title: "Добавить книгу", isButtonEnable: true, action: {
                recommendationsCoordinator?.openAddingBookScreen()
            })
        }
    }
}

#Preview {
    NotFoundView()
}
