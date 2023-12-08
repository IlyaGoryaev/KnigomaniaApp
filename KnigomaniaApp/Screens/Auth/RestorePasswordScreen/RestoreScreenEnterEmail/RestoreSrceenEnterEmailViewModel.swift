//
//  RestoreSrceenEnterEmailViewModel.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 08.12.2023.
//

import Combine
import SwiftUI

final class RestoreSrceenEnterEmailViewModel: ObservableObject {
	func validateEmail(_ email: String) -> DataState {
		let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return emailPredicate.evaluate(with: email) ? .successState : .errorState
	}
}
