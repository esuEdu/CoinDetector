//
//  DetailView.swift
//  CoinDetector
//
//  Created by Eduardo on 06/06/24.
//
import SwiftUI
import Charts

struct DetectedObjectsView: View {
    let detectedObjects: [String] // Array to hold detected objects
    
    var objectCounts: [String: Int] {
        Dictionary(grouping: detectedObjects, by: { $0 }).mapValues { $0.count }
    }

    var body: some View {
        VStack {
            Text("Detected Objects")
                .font(.largeTitle)
                .padding()
            
            List(detectedObjects, id: \.self) { object in
                Text(object)
            }
            
            Chart {
                ForEach(objectCounts.sorted(by: >), id: \.key) { key, value in
                    BarMark(
                        x: .value("Object", key),
                        y: .value("Count", value)
                    )
                    .annotation {
                        Text("\(value)")
                    }
                }
            }
            .frame(height: 300)
            .padding()
        }
        .navigationTitle("Details")
    }
}

#Preview {
    DetectedObjectsView(detectedObjects: ["Coin", "Key", "Coin", "Pen", "Coin", "Key"])
}

