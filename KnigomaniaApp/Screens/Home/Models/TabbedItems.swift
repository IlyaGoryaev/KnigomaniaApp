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
            return "homeicon"
        case .library:
            return "libraryicon"
        case .scan:
            return "scanicon"
        case .settings:
            return "settingsicon"
        }
    }
}
