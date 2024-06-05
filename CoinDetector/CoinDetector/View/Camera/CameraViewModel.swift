//
//  CameraViewModel.swift
//  CoinDetector
//
//  Created by Eduardo on 04/06/24.
//
import Foundation
import SwiftUI
import Combine
import AVFoundation

@Observable class CameraViewModel {
    /// A camada de preview dentro do app
    var imageView: UIImage? = nil
    
    private var videoCapture: VideoCapture!
    private var cancellables = Set<AnyCancellable>()
    
    func disableCaptureSession () {
        self.videoCapture.disableCaptureSession()
    }
    
    func enableCaptureSession () {
        self.videoCapture.enableCaptureSession()
    }
    
    func configure() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
    }

    func toggleCamera() {
        videoCapture.toggleCameraSelection()
    }
    
    private func processFrame(_ frame: Frame) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(frame) else { return }
        let ciImage = CIImage(cvImageBuffer: imageBuffer)
        let context = CIContext()
        if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
            self.imageView = UIImage(cgImage: cgImage)
        }
    }
}

extension CameraViewModel: VideoCaptureDelegate {
    func videoCapture(_ videoCapture: VideoCapture, didCreate framePublisher: FramePublisher) {
        framePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] frame in
                self?.processFrame(frame)
            }
            .store(in: &cancellables)
    }
}
