//
//  BookPageViewModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 01.11.2023.
//

import SwiftUI
import Combine

class BookPageViewModel: ObservableObject {
	
	@Published var book: BookPageModel
	
	@Published var selection: Int = 0
	
	init() {
		self.book = TestBookPageData.book
	}

}
