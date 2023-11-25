//
//  EntryViewProtocol.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation
import SwiftUI

protocol EntryViewProtocol: View {
	
	var entryCoordinator: EntryCoordinator? { set get }
	 
}
