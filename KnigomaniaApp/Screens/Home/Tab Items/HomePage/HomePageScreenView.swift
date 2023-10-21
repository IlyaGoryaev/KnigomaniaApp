//
//  HomePageScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct HomePageScreenView: View {
	
    @State private var selection = 0
    @State private var index = 0
	
	weak var mainScreenCoordinator: MainCoordinator?
    
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Привет, Мария!")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(CustomColors.darkBrownColor)
                    Spacer()
                    HStack(spacing: 8) {
                        Button(action: {
                            
                        }, label: {
                            Image("notificationicon")
                        })
                        Image("")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 2))
                    }
                }
                .padding(.top, 29)
                .padding(.horizontal, 16)
				ScrollView(.horizontal, showsIndicators: false){
					HStack(spacing: 29) {
						Text("Мой прогресс")
							.foregroundColor(CustomColors.darkBrownColor)
							.font(.system(size: 14))
							.fontWeight(index == 0 ? .semibold : .regular)
							.onTapGesture {
								withAnimation(.default) {
									index = 0
									selection = 0
								}
							}
							.overlay(
								Rectangle()
									.frame(height: index == 0 ? 2 : 0)
									.foregroundColor(CustomColors.yellowColor)
									.padding(.top, 22)
							)
						Text("Читаю сейчас")
							.foregroundColor(CustomColors.darkBrownColor)
							.font(.system(size: 14))
							.fontWeight(index == 1 ? .semibold : .regular)
							.onTapGesture {
								withAnimation(.default) {
									index = 1
									selection = 1
								}
							}
							.overlay(
								Rectangle()
									.frame(height: index == 1 ? 2 : 0)
									.foregroundColor(CustomColors.yellowColor)
									.padding(.top, 22)
							)
						Text("Прочитал")
							.foregroundColor(CustomColors.darkBrownColor)
							.font(.system(size: 14))
							.fontWeight(index == 2 ? .semibold : .regular)
							.onTapGesture {
								withAnimation(.default) {
									index = 2
									selection = 2
								}
							}
							.overlay(
								Rectangle()
									.frame(height: index == 2 ? 2 : 0)
									.foregroundColor(CustomColors.yellowColor)
									.padding(.top, 22)
							)
						Text("Хочу прочитать")
							.foregroundColor(CustomColors.darkBrownColor)
							.font(.system(size: 14))
							.fontWeight(index == 3 ? .semibold : .regular)
							.onTapGesture {
								withAnimation(.default) {
									index = 3
									selection = 3
								}
							}
							.overlay(
								Rectangle()
									.frame(height: index == 3 ? 2 : 0)
									.foregroundColor(CustomColors.yellowColor)
									.padding(.top, 22)
							)
						Spacer()
					}
					.padding(.leading, 16)
					.padding(.top, 24)
					.edgesIgnoringSafeArea(.trailing)
				}
                
                TabView(selection: $selection) {
                    StatisticsView(mainScreenCoordinator: mainScreenCoordinator)
                        .tag(0)
					CurrentLibraryView(books: [BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")], mainScreenCoordinator: mainScreenCoordinator)
                        .tag(1)
					CurrentLibraryView(books:[BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")])
						.tag(2)
					CurrentLibraryView(books:[BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")])
						.tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: selection) { s in
                    withAnimation {
                        index = s
                    }
                }
				.onAppear{
					setupAppearance()
				}
                Spacer()
            }
        }
    }
	
	func setupAppearance() {
		UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(CustomColors.brownColor)
		UIPageControl.appearance().pageIndicatorTintColor = UIColor(CustomColors.brownColor).withAlphaComponent(0.2)
	}
	
}

#Preview {
    HomePageScreenView()
}
