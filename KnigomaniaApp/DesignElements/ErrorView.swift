//
//  ErrorView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import UIKit

class ErrorView: UIView {
	
	//MARK: Private properties
	
	private lazy var divider = makeDividerView()
	
	//MARK: Initialize
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
		setupDividerConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

//MARK: UI

private extension ErrorView {
	
	func makeDividerView() -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .darkbrowncolor
		return view
	}
	
	func setup() {
		self.backgroundColor = .white
		self.layer.cornerRadius = Sizes.ErrorView.cornerRadius.rawValue
	}
	
}

//MARK: Constraints

private extension ErrorView {
	
	func setupDividerConstraints() {
		self.addSubview(divider)
		NSLayoutConstraint.activate([
			divider.heightAnchor.constraint(equalToConstant: 1),
			divider.widthAnchor.constraint(equalToConstant: Sizes.ErrorView.width.rawValue),
			divider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Sizes.ErrorView.buttonHeight.rawValue)
		])
	}
	
}
