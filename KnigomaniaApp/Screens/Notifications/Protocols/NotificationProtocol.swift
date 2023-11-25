//
//  NotificationProtocol.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation
import SwiftUI

enum Expanded {
	case description
	case short
}

protocol NotificationViewProtocol: View {
	var isRead: Bool { get set }
	var isExpanded: Expanded { get set }
}
