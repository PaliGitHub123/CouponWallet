//
//  CameraPreviewPage.swift
//  CouponWallet
//
//copied code from: https://scanbot.io/techblog/vndocumentcameraviewcontroller-ios-document-scanner-tutorial/
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
                Button("Scan Document") {
                    isShowingScanner = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .sheet(isPresented: $isShowingScanner) {
            DocumentScanner(scannedImage: $scannedImage)
        }
    }
}
