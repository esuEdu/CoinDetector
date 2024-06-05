//
//  CameraView.swift
//  CoinDetector
//
//  Created by Eduardo on 04/06/24.
//

import SwiftUI

struct CameraView: View {
    
    var viewModel = CameraViewModel()
    
    var body: some View {
        VStack {
            if let imageView = viewModel.imageView {
                Image(uiImage: imageView)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(maxWidth: .infinity)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                    .overlay (alignment: .center) {
                        ProgressView()
                    }
            }
        }
        .onAppear {
            viewModel.configure()
        }
        .onDisappear {
            viewModel.disableCaptureSession()
        }
    }
}

#Preview {
    CameraView()
}
