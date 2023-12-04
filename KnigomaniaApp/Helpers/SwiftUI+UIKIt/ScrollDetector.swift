//
//  ScrollDetector.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 04.12.2023.
//

import SwiftUI

struct ScrollDetector: UIViewRepresentable {
	
	//Замыкание в которое будет передаваться текущий offset
	var onScroll: (CGFloat) -> Void
	
	//Замыкание которое вызывается когда пользователь отпускает палец
	var onDraggingEnd: (CGFloat, CGFloat) -> Void
	
	class Coordinator: NSObject, UIScrollViewDelegate {
	
		var parent: ScrollDetector
		
		var isDelegateAdded: Bool = false
		
		init(parent: ScrollDetector) {
			self.parent = parent
		}
		
		func scrollViewDidScroll(_ scrollView: UIScrollView) {
			parent.onScroll(scrollView.contentOffset.y)
		}
		
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) { }
	
	func makeCoordinator() -> Coordinator {
		Coordinator(parent: self)
	}
	
	func makeUIView(context: Context) -> UIView {
		let uiView = UIView()
		DispatchQueue.main.async {
			if let scrollView = recursiveFindScrollView(view: uiView), !context.coordinator.isDelegateAdded {
				scrollView.delegate = context.coordinator
				context.coordinator.isDelegateAdded = true
			}
		}
		return uiView
	}
	
	func recursiveFindScrollView(view: UIView) -> UIScrollView? {
		if let scrollView = view as? UIScrollView {
			return scrollView
		} else {
			if let superview = view.superview {
				return recursiveFindScrollView(view: superview)
			} else {
				return nil
			}
		}
	}
}
