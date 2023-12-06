//
//  LoginScreenViewModel.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 6/12/23.
//

import UIKit

class LoginScreenViewModel: ObservableObject {
    func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
