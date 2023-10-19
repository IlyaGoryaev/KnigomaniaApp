//
//  SceneDelegate.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 24.09.2023.
//

import UIKit
import SwiftUI
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

	var coordinator: Coordinator?
	private let isUserAutorise = CurrentValueSubject<Bool, Never>(false)
	var cancallables = Set<AnyCancellable>()
	

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let window = UIWindow(windowScene: windowScene)
		let viewController = UINavigationController()
		let uiHostingController = UIHostingController(rootView: SplashScreenView())
		viewController.pushViewController(uiHostingController, animated: false)
		viewController.navigationBar.isHidden = true
		self.window = window
		self.window?.rootViewController = viewController
		self.window?.makeKeyAndVisible()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3){
			self.isUserAutorise.sink { [weak self] boolValue in
				guard let self = self else { return }
				if boolValue{
					let mainCoordinator = MainCoordinator(navigationController: viewController)
					mainCoordinator.start()
					self.coordinator = mainCoordinator
				} else {
					viewController.removeFromParent()
					let entryCoordinator = EntryCoordinator(navigationController: viewController, isUserAutorise: isUserAutorise)
					entryCoordinator.start()
					self.coordinator = entryCoordinator
				}
			}.store(in: &self.cancallables)
			
		}
    }
}

