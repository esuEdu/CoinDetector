//
//  VisionViewModel.swift
//  CoinDetector
//
//  Created by Eduardo on 06/06/24.
//

import Foundation
import Combine

class VisionViewModel: ObservableObject {
    @Published var detectedObjects: [String] = []

    // Add method to update detected objects
    func updateDetectedObjects(_ objects: [String]) {
        self.detectedObjects = objects
    }
}

