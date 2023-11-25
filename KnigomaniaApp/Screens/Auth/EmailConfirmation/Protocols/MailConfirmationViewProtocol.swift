//
//  MailConfirmationViewProtocol.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//
import SwiftUI
import Foundation

protocol MailConfirmationViewProtocol: View {
	
	var mailConfirmationCoordinator: MailConfirmationCoordinator? { set get }
	
}
