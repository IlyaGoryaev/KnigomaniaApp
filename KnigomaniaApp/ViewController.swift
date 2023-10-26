//
//  ViewController.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 24.09.2023.
//

import UIKit

class ViewController: UIViewController {

	private lazy var button = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupStyle()
		setupLayoutConstraints()
		self.navigationController?.navigationBar.isHidden = true
		// Do any additional setup after loading the view.
	}
	
	
	/*
	 // MARK: - Navigation
	 
	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using segue.destination.
	 // Pass the selected object to the new view controller.
	 }
	 */
	
}
private extension ViewController {
	
	func setupStyle(){
		button.backgroundColor = .red
		button.setTitle("Button", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	func setupLayoutConstraints(){
		view.addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		
		])
	}
	
	@objc func buttonTapped(){
		let viewController = UIViewController()
		viewController.view.backgroundColor = .red
		self.navigationController!.pushViewController(viewController, animated: true)
		print("Button")
	}


}

