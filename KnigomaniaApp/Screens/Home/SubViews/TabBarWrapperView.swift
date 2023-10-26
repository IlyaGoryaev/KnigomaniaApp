//
//  TabBarWrapperView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 23/10/23.
//

import SwiftUI
import UIKit

struct TabBarWrapperView: UIViewControllerRepresentable {
    @Binding var selection: Int
    
    weak var mainScreenCoordinator: MainCoordinator?
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        return tabBarController
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        let homeViewController = UIHostingController(rootView: HomePageScreenView(mainScreenCoordinator: mainScreenCoordinator))
        homeViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: ""), tag: 0)
        
        let libraryViewController = UIHostingController(rootView: RecommendationsScreenView())
        libraryViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: ""), tag: 1)
        
        let scanViewController = UIHostingController(rootView: ScanScreenView())
        scanViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: ""), tag: 2)
        
        let settingsViewController = UIHostingController(rootView: SettingsScreenView())
        settingsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: ""), tag: 3)
        
        uiViewController.viewControllers = [homeViewController, libraryViewController, scanViewController, settingsViewController]
        
        uiViewController.selectedIndex = selection
    }
}
