//
//  BarcodeOverlay.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 13/11/23.
//

import SwiftUI
import AVFoundation

struct BarcodeOverlay: View {
    @Binding var captureSession: AVCaptureSession?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 315, height: 171)
                .onAppear {
                    DispatchQueue.global().async {
                        self.captureSession?.startRunning()
                    }
                }
                .onDisappear {
                    DispatchQueue.global().async {
                        self.captureSession?.stopRunning()
                    }
                }
        }
    }
}