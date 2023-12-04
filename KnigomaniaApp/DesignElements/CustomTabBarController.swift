//
//  CustomTabBarController.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import UIKit

class CustomTabBarViewController: UITabBarController {
	
	let roundedLayer = CAShapeLayer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(CustomColors.background)
		tabBar.backgroundImage = UIImage()
		tabBar.backgroundColor = .clear
		tabBar.shadowImage = UIImage()
		tabBar.unselectedItemTintColor = UIColor(CustomColors.tabBarUnselectedColor)
		setUpTabBarAppearence()
	}
	
}
private extension CustomTabBarViewController {
	
	func setUpTabBarAppearence(){
		let width = tabBar.bounds.width
        _ = tabBar.bounds.height
        roundedLayer.fillColor = UIColor(CustomColors.brownColor.opacity(0.75)).cgColor
		let bezierPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: width, height: 100), cornerRadius: 8)
		roundedLayer.path = bezierPath.cgPath
		tabBar.layer.insertSublayer(roundedLayer, at: 0)
		tabBar.itemWidth = width / 7
		tabBar.itemPositioning = .centered
		tabBar.tintColor = .white
	}
	
}
