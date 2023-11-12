//
//  RegistrationOnboardingViewProtocol.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 10.11.2023.
//

import Foundation
import SwiftUI

protocol RegistrationOnboardingViewProtocol: View {
	
	var applicationCoordinator: RegistrationOnboardingCoordinator? { set get }
	
}
