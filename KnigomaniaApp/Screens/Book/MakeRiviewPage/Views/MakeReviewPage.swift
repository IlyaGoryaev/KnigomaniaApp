//
//  MakeReviewPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 24.10.2023.
//

import SwiftUI
import Combine

struct MakeReviewPage: View {
	
	weak var bookCoordinator: BookCoordinator?

	@State 
	private var textHeadline: String = ""
	
	@State 
	private var textReview: String = ""
	
	@State 
	private var isSend: Bool = false
	
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0){
                NavBar(title: .emptyTitle) {
					bookCoordinator?.dismiss()
				}
				.padding(.top, 32)
				MakeReviewPageBook(author: "fewfew", year: "2016", bookGrade: 4.1)
					.padding(.top, 20)
				if isSend{
					VStack(spacing: 0){
						Text("Благодарим за ваш отзыв! Отправленная вами рецензия будет опубликована после прохождения модерации.")
							.lineSpacing(10)
							.font(.system(size: 16))
							.foregroundStyle(CustomColors.darkBrownColor)
							.padding(.horizontal, 16)
							.padding(.top, 24)
						Spacer()
					}
					
				} else {
					VStack(spacing: 0){
						HeadlineReview(text: $textHeadline)
							.padding(.top, 24)
						ReviewText(text: $textReview)
							.padding(.top, 16)
						ButtonView(title: "Отправить", isButtonEnable: validateTextReview() && validateTextHeadline() ? true : false) {
							withAnimation{
								isSend = true
							}
						}
						.padding(.top, 16)
						Spacer()
					}
				}
			}
		}
    }
	
	func validateTextHeadline() -> Bool {
		textHeadline != "" && textHeadline.count <= 30
	}
	
	func validateTextReview() -> Bool {
		textReview != "" && textReview.count <= 500
	}
}

struct ReviewText: View {
	
	@Binding var text: String
	
	@State private var isActive: Bool = false
		
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Текст рецензии")
				.foregroundStyle(CustomColors.darkBrownColor)
				.font(.system(size: 14))
			ZStack(alignment: .bottomTrailing) {
				TextField(text: $text, axis: .vertical) {
					Text("Введите текст рецензии")
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.beigeColor)
				}
				.foregroundStyle(CustomColors.darkBrownColor)
				.padding(.top, 16)
				.padding(.horizontal, 8)
				.padding(.bottom, 28)
				.frame(height: 180, alignment: .topLeading)
				.modifier(TextFieldModifier(isActive: $isActive))
				Text("\(text.count)/500")
					.textStyle(.regularText)
					.padding(8)
			}
		}
		.padding(.horizontal, 16)
	}
}

struct HeadlineReview: View {
	
	@Binding 
	var text: String
	
	@State 
	private var textIn: String = ""
	
	@State 
	private var isActive: Bool = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8){
			Text("Заголовок рецензии")
				.foregroundStyle(CustomColors.darkBrownColor)
				.font(.system(size: 14))
			ZStack(alignment: .trailing) {
				TextField(text: $text) {
					Text("Введите заголовок")
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.beigeColor)
				}
				.foregroundStyle(CustomColors.darkBrownColor)
				.padding(.leading, 8)
				.padding(.vertical, 16)
				.padding(.trailing, 60)
				.modifier(TextFieldModifier(isActive: $isActive))

				Text("\(text.count)/30")
					.textStyle(.regularText)
					.padding(.horizontal, 8)
			}
		}
		.padding(.horizontal, 16)
	}
}

struct MakeReviewPageBook: View {
	
	let author: String
	let year: String
	let bookGrade: Double
	
	var body: some View {
		HStack{
			Image("book1")
				.resizable()
				.frame(width: 124, height: 175)
				.clipShape(RoundedRectangle(cornerRadius: 4))
			VStack(alignment: .leading){
				VStack(alignment: .leading, spacing: 8){
					Text("**Автор**: \(author)")
					Text("**Год**: \(year)")
				}
				.font(.system(size: 16))
				.foregroundStyle(CustomColors.darkBrownColor)
				Spacer()
				VStack(alignment: .leading, spacing: 8){
					Text("**Ваша оценка:**")
					HStack(spacing: 4){
						ForEach(1..<6){ index in
							Image("Star 5")
						}
						HStack(spacing: 5){
							Text(bookGrade.description)
								.font(.system(size: 16, weight: .bold))
								.foregroundStyle(CustomColors.darkBrownColor)
							Text("(5)")
								.font(.system(size: 16))
								.foregroundStyle(CustomColors.brownColor)
						}
					}
				}
			}
		}
		.frame(height: 175)
	}
}

#Preview {
    MakeReviewPage()
}
