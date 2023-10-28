//
//  HomePageScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct HomePageScreenView: View {
	
	@State private var selection = 0
	@Namespace private var lineAnimation
	@State private var lineWidth: CGFloat = 0
	
	@State private var categories: [String] = ["Мой прогресс", "Читаю сейчас", "Прочитал"]
	
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
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack {
						ForEach(categories.indices, id: \.self) { index in
							if selection == index {
								VStack {
									Text(categories[index])
										.foregroundStyle(CustomColors.darkBrownColor)
										.font(.system(size: 14))
									RoundedRectangle(cornerRadius: 2)
										.foregroundColor(CustomColors.yellowColor)
										.frame(height: 2)
										.matchedGeometryEffect(id: "line", in: lineAnimation)

									Spacer()
								}
								
									
							} else {
								VStack{
									Text(categories[index])
										.foregroundStyle(CustomColors.darkBrownColor)
										.font(.system(size: 14))
										.onTapGesture {
											withAnimation {
												selection = index
											}
										}
									Spacer()
								}
								
							}
						}
					}
					.padding(.leading, 21)
					.padding(.top, 24)
					.edgesIgnoringSafeArea(.trailing)
				}
				.frame(height: 40)
				
				TabView(selection: $selection) {
					StatisticsView(mainScreenCoordinator:mainScreenCoordinator)
						.tag(0)
					CurrentLibraryView(books: [BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")], mainScreenCoordinator: mainScreenCoordinator)
						.tag(1)
					CurrentLibraryView(books: [BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")], mainScreenCoordinator: mainScreenCoordinator)
						.tag(2)
				}
				.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			}
		}
		.onAppear(perform: {
			
			lineWidth = getLabelWidth(text: "Мой прогресс")
			setupAppearance()
		})
	}
	
	func setupAppearance() {
		UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(CustomColors.brownColor)
		UIPageControl.appearance().pageIndicatorTintColor = UIColor(CustomColors.brownColor).withAlphaComponent(0.2)
	}
		
	
	
	func getLabelWidth(text: String) -> CGFloat {
		let label = UILabel()
		label.text = text
		label.font = .systemFont(ofSize: 16)
		label.sizeToFit()
		return label.frame.size.width
	}
}

#Preview {
	HomePageScreenView()
}
