//
//  AddBookToListPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.10.2023.
//

import SwiftUI

struct AddBookToListPage: View {
	
	weak var bookCoordinator: BookCoordinator?
	
	@State private var category: ListCategories = .toRead
	
	@State private var isListExpanded: Bool = false
	
	@State private var customCategoryText: String = ""
	
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
				NavBar(title: "") {
					bookCoordinator?.backAction()
				}
				.padding(.top, 32)
				MakeReviewPageBook(author: "feiohfiew", year: "2022", bookGrade: 5.0)
					.padding(.top, 20)
				Text("Добавить в список")
					.padding(.top, 40)
					.font(.system(size: 20, weight: .medium))
					.foregroundStyle(CustomColors.darkBrownColor)
				ZStack(alignment: .top){
					VStack(spacing: 0){
						ChooseCategoryView(category: $category, isListExpanded: $isListExpanded)
							.padding(.top, 32)
						if category == .addList{
							CategoryNameTextField(nameText: $customCategoryText)
								.padding(.top, 24)
							ButtonView(title: "Сохранить", isButtonEnable: true) {
								bookCoordinator?.backAction()
							}
							.padding(.top, 32)
						} else {
							ButtonView(title: "Добавить книгу", isButtonEnable: true) {
								bookCoordinator?.backAction()
							}
							.padding(.top, 32)
						}
					}
					
					ExpandedList(categoryChoosen: $category, isListExpanded: $isListExpanded)
						.opacity(isListExpanded ? 1 : 0)
						.offset(y: 120)
				}
				Spacer()
			}
		}
    }
}

struct ChooseCategoryView: View {
	
	@Binding var category: ListCategories
	
	@Binding var isListExpanded: Bool
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0){
			Text("Мои списки")
			HStack{
				Text(category.rawValue)
				Spacer()
				Image(systemName: "chevron.down")
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 8)
			.padding(.vertical, 16)
			.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.white))
			.overlay(content: {
				RoundedRectangle(cornerRadius: 8)
					.stroke(CustomColors.darkBrownColor, lineWidth: 1)
					.opacity(isListExpanded ? 1 : 0)
			})
			.padding(.top, 8)
			.onTapGesture {
				isListExpanded.toggle()
			}
		}
		.font(.system(size: 14))
		.foregroundStyle(CustomColors.darkBrownColor)
		.padding(.horizontal, 16)
	}
}

struct ExpandedList: View {
	
	@Binding var categoryChoosen: ListCategories
	
	@Binding var isListExpanded: Bool
	
	var body: some View {
		VStack(spacing: 0){
			ForEach(ListCategories.allCategories, id: \.self) { item in
				Text(item.rawValue)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.vertical, 16)
					.padding(.horizontal, 8)
					.onTapGesture {
						categoryChoosen = item
						isListExpanded = false
					}
			}
		}
		.font(.system(size: 14))
		.foregroundStyle(CustomColors.darkBrownColor)
		.background(RoundedRectangle(cornerRadius: 8).foregroundStyle(.white))
		.padding(.horizontal, 16)
	}
}

struct CategoryNameTextField: View {
	
	@Binding var nameText: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8){
			Text("Название")
			TextField(text: $nameText) {
				Text("Вдохновение")
					.foregroundStyle(CustomColors.darkBrownColor)
			}
			.padding(.vertical, 16)
			.padding(.horizontal, 8)
			.background(RoundedRectangle(cornerRadius: 8).foregroundStyle(.white))
		}
		.font(.system(size: 14))
		.padding(.horizontal, 16)
		.foregroundStyle(CustomColors.darkBrownColor)
	}
}

#Preview {
    AddBookToListPage()
}
