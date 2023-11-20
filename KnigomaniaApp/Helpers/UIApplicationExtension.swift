//
//  UIApplicationExtension.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 20/11/23.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
