//
//  ScanScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 17/10/23.
//

import SwiftUI
import AVFoundation

struct ScanScreenView: View {
    weak var scanCoordinator: ScanCoordinator?
	weak var recommendationsCoordinator: RecommendationsCoordinator?
    
    @State private var captureSession: AVCaptureSession?
    @State private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
	
    var body: some View {
        ZStack {
            VideoCaptureView(captureSession: $captureSession, videoPreviewLayer: $videoPreviewLayer)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                HStack {
                    Color.black.opacity(0.5)
                }
                .edgesIgnoringSafeArea(.all)
                HStack {
                    Color.black.opacity(0.5)
                        .frame(width: 30)
                    Spacer()
                    Color.black.opacity(0.5)
                        .frame(width: 30)
                }
                .frame(height: 171)
                .edgesIgnoringSafeArea(.all)
                HStack {
                    Color.black.opacity(0.5)
                }
                .edgesIgnoringSafeArea(.all)
            }
            BarcodeOverlay(captureSession: $captureSession)
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear(perform: startSession)
    }
    
    private func startSession() {
        DispatchQueue.global().async {
            guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.videoGravity = .resizeAspectFill
                videoPreviewLayer?.frame = UIScreen.main.bounds
                
                DispatchQueue.main.async {
                    self.captureSession?.startRunning()
                }
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ScanScreenView()
}
