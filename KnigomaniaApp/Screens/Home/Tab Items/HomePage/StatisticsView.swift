//
//  StatisticsView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 20/10/23.
//

import SwiftUI

struct StatisticsView: View {
    @State private var selection = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(CustomColors.darkBrownColor)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(CustomColors.brownColor.opacity(0.75))
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MyProgress(goalValue: 150, currentValue: 25)
                .tag(0)
            FriendsStatisticView()
                .tag(10)
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    StatisticsView()
}
