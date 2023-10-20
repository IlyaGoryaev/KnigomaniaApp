//
//  BookChallengeView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 16.10.2023.
//

import SwiftUI

struct BookChallengeView: View {
	
	var action: () -> ()
	
	var body: some View {
		HStack{
			VStack(alignment: .leading, spacing: 8){
				Text("Книжный вызов")
					.foregroundStyle(Color.white)
					.font(.system(size: 18, weight: .semibold))
				Text("Брось своим друзьям книжный вызов, \nчтобы следить за их прогрессом!")
					.foregroundStyle(Color.white)
					.font(.system(size: 11, weight: .medium))
			}
			Spacer()
			Image("BookChallendgeImage")
		}
		.padding(.horizontal, 16)
		.padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 8).foregroundStyle(CustomColors.brownColor).opacity(0.5))
		.padding(.horizontal, 16)
		.onTapGesture {
			action()
		}
	}
}

#Preview {
	BookChallengeView{
		print("Tap book challenge")
	}
}
