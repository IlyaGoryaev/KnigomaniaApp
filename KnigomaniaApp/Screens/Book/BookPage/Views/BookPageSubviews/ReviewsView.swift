//
//  ReviewsView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct ReviewsView: View {
	
	let reviews: [Review]
	
    var body: some View {
		VStack{
			HStack{
				Text("Рецензии")
					.font(.system(size: 20, weight: .medium))
					.foregroundStyle(CustomColors.darkBrownColor)
				Spacer()
				if !reviews.isEmpty{
					HStack{
						Text("Весь раздел")
						Image(systemName: "chevron.right")
					}
					.font(.system(size: 14))
					.foregroundStyle(CustomColors.darkBrownColor)
				}
			}
			.padding(.horizontal, 16)
			if !reviews.isEmpty{
				VStack{
					ForEach(reviews.indices, id: \.self){ index in
						ReviewItemView(review: reviews[index])
					}
				}
				.padding(.top, 32)
			} else {
				Text("Ещё никто не оставил рецензию. Будь первым!")
					.font(.system(size: 16))
					.padding(.horizontal, 16)
					.padding(.top, 32)
			}
		}
		
		
    }
}

struct ReviewItemView: View {
	
	let review: Review
		
	var body: some View {
		HStack{
			VStack{
				Text("\(Int(review.grade)) (5)")
				Image("star.fill")
			}
			VStack(alignment: .leading, spacing: 8){
				HStack{
					Text("Книга захватывает")
					Spacer()
					Image("like")
						.padding(.horizontal, 16)
				}
				Text("Интересно написано, хотя не во всем соглашусь с автором. Нравится способ повествования, и то как автор поветсвует историю. На самом деле я читал книги в подобном жанре, и fopewpofeopwfopweopfpoweopfopewiofieopwifoieopwifopeiwopfioewiofieowifopewofiopweifopiewopfiopweifoweiofiweoifowieofiweoifopwieofiweoi foewifopiewopifopiweopefiopwei f[pewifweipfiwpeifp[iwp[f fpewof[powep[ofp[owepf fp[ewopfop[ewopfowe")
					.font(.system(size: 14))
					.frame(maxHeight: 90)
			}
		}
		.padding(.horizontal, 16)
	}
}

#Preview {
	ReviewsView(reviews: [Review(text: "cvihdshvidshiovhciosdhiovchsdiohvciohsdiohcviovsdhiochiodshoichosdihiocsdiohiochsdiohiochsdi", grade: 4.5, isLiked: true)])
}
