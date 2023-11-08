//
//  ReviewPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 23.10.2023.
//

import SwiftUI

struct ReviewPage: View {
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
                NavBar(title: .emptyTitle) {
					
				}
				.padding(.top, 30)
				
				Spacer()
			}
		}
    }
}

#Preview {
    ReviewPage()
}
