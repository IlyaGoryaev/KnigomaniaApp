//
//  CustomActivityIndicator.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 28/9/23.
//

import SwiftUI

struct CustomActivityIndicator: View {
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [Color.clear, CustomColors.brownColor]), center: .center),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 28, height: 28, alignment: .center)
                .rotationEffect(Angle(degrees: isLoading ? 0 : -360))
                .onAppear() {
                    withAnimation(
                        Animation
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)
                    ) {
                        isLoading.toggle()
                    }
                }
        }
    }
}

#Preview {
    CustomActivityIndicator()
}
