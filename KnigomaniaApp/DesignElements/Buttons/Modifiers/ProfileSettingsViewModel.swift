//
//  ProfileSettingsViewModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation
import Combine

final class ProfileSettingsViewModel: ObservableObject {
	
	@Published var person = UserModel(firstName: "fjeowjfw", secondName: "fewfew", gender: .male, password: "fewfewf", email: "fewfewqfdsgfds")
	
	
}
