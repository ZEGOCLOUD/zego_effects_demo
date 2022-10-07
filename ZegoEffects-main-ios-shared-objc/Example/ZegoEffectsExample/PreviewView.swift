//
//  PreviewView.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/1.
//  Copyright © 2021 Zego. All rights reserved.
//

import SwiftUI
import AVFoundation
import Photos

struct PreviewView: UIViewRepresentable {

    // Simply use UIImageView to render pixel buffer
    let view = UIImageView()

    let faceDetectionLayer = CAShapeLayer()

    var effectsCoordinator: ZegoEffectsCoordinator?

    // Press 'Compare button' to view origin effects
    var renderOriginBuffer = false

    // Press 'Capture photo button' to stop render, and keep the last image
    var stopRendering = false

    func makeUIView(context: Context) -> UIView {
        view.backgroundColor = UIColor.black
        view.contentMode = .scaleAspectFit

        // SwiftUI uses the compression resistance priority and the content hugging priority to decide what resizing is possible.
        // If you want to resize a view below its intrinsic content size, you need to reduce the compression resistance priority.
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        // The face detection results are drew on this layer
        faceDetectionLayer.fillColor = UIColor.clear.cgColor
        faceDetectionLayer.strokeColor = UIColor.orange.cgColor
        faceDetectionLayer.lineWidth = 3
        view.layer.addSublayer(faceDetectionLayer)

        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }

    public func renderBuffer(_ pixelBuffer: CVPixelBuffer) {

        if stopRendering {
            return
        }

        // Process the origin buffer with ZegoEffects SDK
        // We are currently in the sessionQueue ( DispatchQueue(label: "im.zego.CameraService.sessionQueue") )
        if let effects = effectsCoordinator {
            if !renderOriginBuffer {
                effects.processBuffer(pixelBuffer)
            }
        }

        let image = UIImage.init(ciImage: CIImage.init(cvPixelBuffer: pixelBuffer))

        DispatchQueue.main.async {
            view.image = image

            // Draw face detection rectangles
            updateFaceDetectionResults()
        }
    }

    private func updateFaceDetectionResults() {

        if let rects = effectsCoordinator?.faceDetectionRects {
            if rects.count == 0 {
                faceDetectionLayer.path = nil
                return
            }

            let viewSize = view.frame.size
            let bufferSize = view.image?.size ?? CGSize(width: 0, height: 0)

            let heightRatio = viewSize.height / bufferSize.height
            let widthRatio = viewSize.width / bufferSize.width

            let paths = CGMutablePath()
            for rect in rects {
                let zoomRect = CGRect(x: rect.origin.x * widthRatio, y: rect.origin.y * heightRatio,
                                      width: rect.size.width * widthRatio, height: rect.size.height * heightRatio)
                let path = UIBezierPath(rect: zoomRect)
                paths.addPath(path.cgPath)
            }
            faceDetectionLayer.path = paths
        }
    }

    public func saveImageToPhotoLibrary(completionHandler handler: @escaping (Bool) -> Void) {
        guard let image = view.image else {
            print("[SavePhoto] No image to be saved")
            handler(false)
            return
        }

        let photoHelper = PhotoHelper()
        photoHelper.writeToPhotoAlbum(image: image) { success in
            if success {
                print("[SavePhoto] Image saved")
                handler(true)
            } else {
                print("[SavePhoto] Save failed! No permission")
                handler(false)
            }

        }
    }

}
