//
//  Sizes.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation

enum Sizes {
	
	enum Padding: CGFloat {
		case normal = 16
		case small = 8
		case double = 24
		case large = 40
		case zero = 0
	}
	
	enum Buttons {
		enum ActionButtonPadding: CGFloat {
			case large = 72
			case normal = 44
		}
	}
	
	enum ProfileImage: CGFloat {
		case normal = 36
		case large = 72
	}
	
	enum ErrorView: CGFloat {
		case height = 162
		case width = 254
		case cornerRadius = 10
		case buttonHeight = 40
	}
}
