//
//  TextFieldDynamicWidth.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/11/23.
//

import SwiftUI

struct TextFieldDynamicWidth: View {
    let title: String
//    let onEditingChanged: (Bool) -> Void
//    let onCommit: () -> Void
    
    @Binding var text: String
    
    @State private var textRect = CGRect()
    
    var body: some View {
        ZStack {
            Text(text == "" ? title : text).background(GlobalGeometryGetter(rect: $textRect)).layoutPriority(1).opacity(0)
            HStack {
                TextField(title, text: $text)
                    .frame(width: textRect.width)
            }
        }
    }
}

struct GlobalGeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }
    
    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }
        
        return Rectangle().fill(Color.clear)
    }
}
