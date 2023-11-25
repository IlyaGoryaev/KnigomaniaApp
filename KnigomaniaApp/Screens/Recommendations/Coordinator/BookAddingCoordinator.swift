//
//  BookAddingCoordinator.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 26/10/23.
//

import Foundation
import SwiftUI

final class BookAddingCoordinator: Coordinator {
    var rootController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.rootController = navigationController
    }
    
    func start() {}
}
