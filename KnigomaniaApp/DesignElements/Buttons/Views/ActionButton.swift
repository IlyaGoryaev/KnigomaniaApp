//
//  ActionButton.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import SwiftUI

enum ActionType {
	case approveAction
	case distructAction
}

struct ActionButton: View {
	
	// MARK: Properties
	
	let title: String
	let padding: CGFloat
	let actionType: ActionType
	
	// MARK: View
	
    var body: some View {
		Button(action: {
			
		}, label: {
			if actionType == .approveAction {
				Text(title)
					.modifier(ApproveAction(padding: padding))
			} else {
				Text(title)
					.modifier(DistructAction(padding: padding))
			}
		})
    }
}

// MARK: Preview

#Preview {
	ActionButton(title: "Принять", padding: Sizes.Buttons.ActionButtonPadding.normal, actionType: .distructAction)
}
