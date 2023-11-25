//
//  CoordinatorProtocol.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
	
	associatedtype controller: UIViewController
	
	var rootController: controller { set get }
	
}
