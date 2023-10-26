//
//  MainCoordinatorProtocol.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import UIKit

protocol MainCoordinatorProtocol: AnyObject{
	
	var tabBarController: UITabBarController { set get }
	
	func start()
	
}
