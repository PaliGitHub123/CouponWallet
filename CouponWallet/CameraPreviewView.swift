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
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)
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

struct DocumentScannerView: UIViewControllerRepresentable {
    @Binding var scannedImage: UIImage?
    @Environment(\.dismiss) var dismiss

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannedImage: $scannedImage, dismiss: dismiss)
    }

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        @Binding var scannedImage: UIImage?
        var dismiss: DismissAction

        init(scannedImage: Binding<UIImage?>, dismiss: DismissAction) {
            self._scannedImage = scannedImage
            self.dismiss = dismiss
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            if scan.pageCount > 0 {
                scannedImage = scan.imageOfPage(at: 0)
            }
            dismiss()
        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            dismiss()
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Scan failed: \(error.localizedDescription)")
            dismiss()
        }
    }
}
