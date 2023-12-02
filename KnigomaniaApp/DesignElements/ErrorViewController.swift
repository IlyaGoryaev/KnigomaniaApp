//
//  ErrorViewController.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import UIKit

class ErrorViewController: UIViewController {
	
	//MARK: Dependencies
	
	//MARK: Private properties
	
	private lazy var errorView = makeErrorView()
	
	//MARK: Initialize
	
	init() {
		super.init(nibName: nil, bundle: nil)
		setup()
		setupErrorViewConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: LifeCycle
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
//MARK: UI

private extension ErrorViewController {
	
	func makeErrorView() -> UIView {
		let view = ErrorView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}
	
	func setup() {
		self.view.backgroundColor = .black.withAlphaComponent(0.4)
		self.modalPresentationStyle = .overFullScreen
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
		self.view.addGestureRecognizer(tapGesture)
	}
	
}

//MARK: Constraints

private extension ErrorViewController {
	
	func setupErrorViewConstraints() {
		self.view.addSubview(errorView)
		NSLayoutConstraint.activate([
			errorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			errorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
			errorView.heightAnchor.constraint(equalToConstant: Sizes.ErrorView.height.rawValue),
			errorView.widthAnchor.constraint(equalToConstant: Sizes.ErrorView.width.rawValue),
		])
	}
	
}

//MARK: Actions

private extension ErrorViewController {
	
	@objc func tapped() {
		self.dismiss(animated: false)
	}
	
}
