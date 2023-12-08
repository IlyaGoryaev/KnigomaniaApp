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

	var userDefaultManager = UserDefaultManager.shared
	
    var window: UIWindow?

	var coordinator: (any Coordinator)?
	private let isUserAuthorize = CurrentValueSubject<Bool, Never>(false)
	var cancallables = Set<AnyCancellable>()
	

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		isUserAuthorize.send(isAuth())
		print(userDefaultManager.getValue())
		let window = UIWindow(windowScene: windowScene)
		let viewController = UINavigationController()
		let uiHostingController = UIHostingController(rootView: SplashScreenView())
		viewController.pushViewController(uiHostingController, animated: false)
		viewController.navigationBar.isHidden = true
		self.window = window
		self.window?.rootViewController = viewController
		self.window?.makeKeyAndVisible()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3){
			self.isUserAuthorize.sink { [weak self] boolValue in
				guard let self = self else { return }
				if boolValue{
					let tabBarController = CustomTabBarViewController()
					self.window?.rootViewController = tabBarController
					self.window?.makeKeyAndVisible()
					let mainCoordinator = MainCoordinatorWithTabBar(tabBarController: tabBarController, isUserAuthorize: isUserAuthorize)
					mainCoordinator.start()
					self.coordinator = mainCoordinator
				} else {
					viewController.removeFromParent()
					let entryCoordinator = EntryCoordinator(navigationController: viewController, isUserAuthorize: isUserAuthorize)
					entryCoordinator.route(view: .startScreen, animated: false)
					self.coordinator = entryCoordinator
				}
			}.store(in: &self.cancallables)
			
		}
    }
	
	private func isAuth() -> Bool {
		userDefaultManager.isAuthorize()
	}
}

