//
//  BookAddingScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct BookAddingScreenView: View {
    @State private var bookAuthor: String = ""
    @State private var bookTitle: String = ""
    @State private var numOfBookPages: String = ""
    @State private var yearOfPublishingBook: String = ""
    @State private var publisherOfBook: String = ""
    @State private var bookISBN: String = ""
    
    weak var recommendationsCoordinator: RecommendationsCoordinator?
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                NavBar(title: .emptyTitle) {
                    recommendationsCoordinator?.backAction()
                }
                ScrollView {
                    TextFieldSection(text: $bookAuthor, title: "Автор", star: "*", placeholder: "Укажите автора")
                        .padding(.top, 20)
                    TextFieldSection(text: $bookTitle, title: "Название", star: "*", placeholder: "Введите название книги")
                        .padding(.top, 16)
                    TextFieldSection(text: $numOfBookPages, title: "Количество страниц", star: "", placeholder: "Введите количество страниц")
                        .padding(.top, 16)
                    GalleryPickerView()
                        .padding(.top, 16)
                    TextFieldSection(text: $yearOfPublishingBook, title: "Год издания", star: "", placeholder: "Укажите год издания")
                        .padding(.top, 16)
                    TextFieldSection(text: $publisherOfBook, title: "Издательство", star: "", placeholder: "Укажите издательство")
                        .padding(.top, 16)
                    TextFieldSection(text: $bookISBN, title: "ISBN", star: "", placeholder: "Введите ISBN")
                        .padding(.top, 16)
					ButtonView(title: .addBook, isButtonEnable: isButtonEnable, action: {})
                        .padding(.top, 32)
                }
                Spacer()
            }
        }
    }
    
    private var isButtonEnable: Bool {
        return !$bookAuthor.wrappedValue.isEmpty && !$bookTitle.wrappedValue.isEmpty
    }
}

#Preview {
    BookAddingScreenView()
}
