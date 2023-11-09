//
//  GradeView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 09.11.2023.
//

import SwiftUI

struct GradeView: View {
	
	let bookGrade: Int
	
	@Binding
	var selection: Int
	
    var body: some View {
		HStack(spacing: 8) {
			Text("Оценить:")
				.textStyle(.boldText)
			HStack(spacing: 4) {
				ForEach(1..<6){ index in
					Image(index > selection ? "Star 1" : "Star 5")
						.onTapGesture {
							withAnimation {
								selection = index
							}
						}
				}
			}
			HStack(spacing: 5) {
				Text(bookGrade.description)
					.textStyle(.boldText)
				Text("(5)")
					.font(.system(size: 16))
					.foregroundStyle(CustomColors.brownColor)
			}
		}
    }
}

#Preview {
	GradeView(bookGrade: 4, selection: .constant(3))
}
