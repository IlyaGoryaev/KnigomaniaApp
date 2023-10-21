//
//  BookActionView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct BookActionsView: View {
	
	let bookButtonInfoDict: [String: String] = ["Icon plus": "Оставить рецензию", "Icon edit": "Добавить в список", "Icon share": "Поделиться книгой"]
	
	var body: some View {
		HStack {
			ForEach(Array<String>(bookButtonInfoDict.keys), id: \.self){ imageName in
				BookPageButton(imageName: imageName, buttonText: bookButtonInfoDict[imageName]!)
			}
		}
		.padding(.horizontal, 16)
	}
	
}

struct BookPageButton: View {
	
	let imageName: String
	
	let buttonText: String
	
	var body: some View {
		VStack{
			Image(imageName)
			Text(buttonText)
				.font(.system(size: 14))
		}
		.foregroundStyle(CustomColors.darkBrownColor)
	}
}

#Preview {
    BookActionsView()
}
