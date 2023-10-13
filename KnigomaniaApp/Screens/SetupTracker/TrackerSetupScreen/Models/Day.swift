//
//  Day.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/10/23.
//

import Foundation

struct Day: Identifiable {
    let name: String
    let id = UUID()
    var isSelected = false
}
