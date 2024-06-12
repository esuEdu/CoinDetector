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

    var objectDetect: [String] = []
    
    // Add method to update detected objects
    func updateDetectedObjects(_ objects: [String]) {
        self.detectedObjects.append(contentsOf: objects)
    }
    
    func getAllObjects() -> [String] {
        var uniqueObjects: [String] = []
        
        for object in detectedObjects {
            if !uniqueObjects.contains(object) {
                uniqueObjects.append(object)
            }
        }
        
        return uniqueObjects
    }
}

