//
//  CameraPreviewPage.swift
//  CouponWallet
//
//  Created by Pál Danyi on 24.07.26.
//

import SwiftUI
import VisionKit

struct CameraPreviewView: View {
    @State private var scannedImage: UIImage?
    @State private var isShowingScanner = false

    var body: some View {
        VStack(spacing: 20) {
            if let image = scannedImage {
                /*Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)*/
                Card(image: image)
            } else {
                Text("No document scanned yet")
                    .foregroundColor(.gray)
            }

            Button("Scan Document") {
                isShowingScanner = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $isShowingScanner) {
            DocumentScannerView(scannedImage: $scannedImage)
        }
    }
}
