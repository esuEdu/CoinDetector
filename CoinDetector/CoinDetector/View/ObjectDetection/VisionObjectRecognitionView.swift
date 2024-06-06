//
//  VisionObjectRecognitionView.swift
//  CoinDetector
//
//  Created by Eduardo on 06/06/24.
//
import SwiftUI
import UIKit
import AVFoundation
import Vision


struct VisionObjectRecognitionView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: VisionViewModel

    class Coordinator: NSObject {
        var parent: VisionObjectRecognitionView

        init(parent: VisionObjectRecognitionView) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> VisionObjectRecognitionViewController {
        let viewController = VisionObjectRecognitionViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    func updateUIViewController(_ uiViewController: VisionObjectRecognitionViewController, context: Context) {
        // Update the view controller if needed.
    }
}


