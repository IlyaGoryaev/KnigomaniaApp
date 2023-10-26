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
    
    func start() {
        var view = NotFoundView()
        view.bookAddingCoordinator = self
        let viewController = UIHostingController(rootView: view)
        rootController.pushViewController(viewController, animated: false)
    }
    
    func addBook() {
        var view = BookAddingScreenView()
        view.bookAddingCoordinator = self
        let viewController = UIHostingController(rootView: view)
        rootController.pushViewController(viewController, animated: true)
        print(rootController)
    }
    
    func backAction() {
        rootController.popViewController(animated: true)
    }
}
