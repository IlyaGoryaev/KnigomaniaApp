//
//  SceneDelegate.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 24.09.2023.
//

import UIKit
import Combine
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var coordinator: Coordinator?

    var window: UIWindow?
	
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
					let apllicationCoordinator = ApplicationCoordinator(navigationController: viewController, isUserAutorise: self.isUserAutorise)
					apllicationCoordinator.start()
					self.coordinator = apllicationCoordinator
				}
			}.store(in: &self.cancallables)

		}
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

