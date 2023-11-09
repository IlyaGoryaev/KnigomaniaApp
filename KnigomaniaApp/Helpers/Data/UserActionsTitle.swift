//
//  UserActionsTitle.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 09.11.2023.
//

import Foundation

struct UserActionsTitle {
	
	enum Sections {
		case makeReviewPage
		case mainScreen
	}
	
	var title: String
	
	init(section: Sections) {
		switch section {
		case .makeReviewPage:
			title = "Благодарим за ваш отзыв! Отправленная вами рецензия будет опубликована после прохождения модерации."
		case .mainScreen:
			title = ""
		}
	}
	
}
