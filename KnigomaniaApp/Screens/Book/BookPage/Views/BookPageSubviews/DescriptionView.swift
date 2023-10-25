//
//  DescriptionView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct DescriptionView: View {
	
	let description: String
	
    var body: some View {
		VStack(alignment: .leading, spacing: 24) {
			Text("О книге")
				.font(.system(size: 20))
				.foregroundStyle(CustomColors.darkBrownColor)
			Text(description)
				.lineSpacing(10)
				.font(.system(size: 16))
				.foregroundStyle(CustomColors.darkBrownColor)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.horizontal, 16)
    }
}

#Preview {
	DescriptionView(description: "dfiojfidjweioj")
}
