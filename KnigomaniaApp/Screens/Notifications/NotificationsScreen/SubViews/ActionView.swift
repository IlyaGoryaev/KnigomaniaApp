//
//  ActionView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import SwiftUI

struct ActionView: View {
    var body: some View {
		HStack {
			ActionButton(title: "Принять", padding: Sizes.Buttons.ActionButtonPadding.normal.rawValue, actionType: .approveAction)
			Spacer()
			ActionButton(title: "Отклонить", padding: Sizes.Buttons.ActionButtonPadding.normal.rawValue, actionType: .distructAction)
		}
		.padding(.horizontal, Sizes.Padding.normal.rawValue)
    }
}

#Preview {
    ActionView()
}
