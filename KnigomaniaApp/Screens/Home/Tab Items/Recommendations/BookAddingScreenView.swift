//
//  BookAddingScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct BookAddingScreenView: View {
    weak var bookAddingCoordinator: BookAddingCoordinator?
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                NavBar(title: "") {
                    bookAddingCoordinator?.backAction()
                }
                ScrollView {
                    TextFieldSection(title: "Автор", placeholder: "Укажите автора")
                        .padding(.top, 20)
                    TextFieldSection(title: "Название", placeholder: "Введите название книги")
                        .padding(.top, 16)
                    TextFieldSection(title: "Количество страниц", placeholder: "Введите количество страниц")
                        .padding(.top, 16)
                    GalleryPickerView(action: {})
                        .padding(.top, 16)
                    TextFieldSection(title: "Год издания", placeholder: "Укажите год издания")
                        .padding(.top, 16)
                    TextFieldSection(title: "Издательство", placeholder: "Укажите издательство")
                        .padding(.top, 16)
                    TextFieldSection(title: "ISBN", placeholder: "Введите ISBN")
                        .padding(.top, 16)
                    ButtonView(title: "Добавить книгу", isButtonEnable: false, action: {})
                        .padding(.top, 32)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    BookAddingScreenView()
}
