//
//  DetailView.swift
//  CoinDetector
//
//  Created by Eduardo on 06/06/24.
//

import SwiftUI

struct DetectedObjectsView: View {
    let detectedObjects: [String] // Array to hold detected objects

    var body: some View {
        VStack {
            Text("Detected Objects")
                .font(.largeTitle)
                .padding()
            
            List(detectedObjects, id: \.self) { object in
                Text(object)
            }
        }
        .navigationBarTitle("Detected Objects", displayMode: .inline)
    }
}

#Preview {
    DetectedObjectsView(detectedObjects: [""])
}
