//
//  ListCategories.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.10.2023.
//

import Foundation

enum ListCategories: String{
	case toRead = "Хочу прочитать"
	case readNow = "Читаю сейчас"
	case read = "Прочитал"
	case addList = "Создать новый список"
	
	static let allCategories = [toRead, readNow, read, addList]
}
