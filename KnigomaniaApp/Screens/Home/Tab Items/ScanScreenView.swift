//
//  ScanScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI

struct ScanScreenView: View {
	
	weak var scanCoordinator: ScanCoordinator?
	
    var body: some View {
		VStack{
			Text("ScanScreenView")
			ButtonView(title: "Button", isButtonEnable: true) {
				scanCoordinator!.openNewScreen()
			}
		}
        
    }
}

struct NextView: View {
	
	weak var scanCoordinator: ScanCoordinator?
	
	var body: some View {
		VStack{
            NavBar(title: .emptyTitle) {
				scanCoordinator!.backAction()
			}
			Spacer()
		}
	}
}

#Preview {
    ScanScreenView()
}
