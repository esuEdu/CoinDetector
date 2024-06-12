//
//  ContentView.swift
//  CoinDetector
//
//  Created by Eduardo on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = VisionViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Object Recognition")
                    .font(.largeTitle)
                    .padding()
                
                VisionObjectRecognitionView(viewModel: viewModel)
                    .edgesIgnoringSafeArea(.all)
                
                NavigationLink(destination: DetectedObjectsView(detectedObjects: viewModel.getAllObjects())) {
                    Text("Show Detected Objects")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Object Recognition", displayMode: .inline)
        }
    }
}


