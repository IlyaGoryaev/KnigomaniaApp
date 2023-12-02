//
//  RegistrationViewModel.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 2/12/23.
//

import UIKit

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var passwordText: String = ""
    @Published var confirmPasswordText: String = ""

    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func endEditing() {
        UIApplication.shared.endEditing()
    }
}
