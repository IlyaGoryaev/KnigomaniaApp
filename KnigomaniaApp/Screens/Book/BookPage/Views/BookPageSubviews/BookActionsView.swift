//
//  BookActionView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI


// Исправить

struct BookActionsView: View {
	
	weak var bookCoordinator: BookCoordinator?
	
	let bookButtonInfoDict: [String: String] = ["Оставить\nрецензию": "Icon plus", "Добавить\nв список": "Icon edit", "Поделиться\nкнигой": "Icon share"]
	let categoryNames = ["Оставить\nрецензию", "Добавить\nв список", "Поделиться\nкнигой"]
	
	var action: () -> ()
	
	var body: some View {
		HStack {
			BookPageButton(imageName: bookButtonInfoDict[categoryNames[0]]!, buttonText: categoryNames[0]){
				bookCoordinator?.route(view: .makeReview, presentType: .present)
			}
			Spacer()
			BookPageButton(imageName: bookButtonInfoDict[categoryNames[1]]!, buttonText: categoryNames[1]){
				//bookCoordinator?.route(view: .addBookToList)
				action()
			}
			Spacer()
			BookPageButton(imageName: bookButtonInfoDict[categoryNames[2]]!, buttonText: categoryNames[2]){
				bookCoordinator?.share()
			}
		}
		.padding(.horizontal, 16)
	}
	
}

struct BookPageButton: View {
	
	let imageName: String
	
	let buttonText: String
	
	var action: () -> ()
	
	var body: some View {
		VStack(spacing: 16){
			Image(imageName)
			Text(buttonText)
				.multilineTextAlignment(.center)
				.font(.system(size: 14))
		}
		.foregroundStyle(CustomColors.darkBrownColor)
		.onTapGesture {
			action()
		}
	}
}

#Preview {
	BookActionsView {
		print("feoihwiofohwe")
	}
}
