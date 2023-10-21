//
//  TabbedItems.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case library
    case scan
    case settings
    
    var iconName: String{
        switch self {
        case .home:
            return "homeIcon"
        case .library:
            return "libraryIcon"
        case .scan:
            return "scanIcon"
        case .settings:
            return "settingsIcon"
        }
    }
}
