//
//  BookPageModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import Foundation

struct BookPageModel {
	
	let title: String
	let author: String
	let year: String
	let grade: Double
	let description: String
	let reviews: [Review] = []
	let similar: [BookPageModel] = []
	
}


struct Review {
	
	let text: String
	let grade: Double
	var isLiked: Bool
	
}
