//
//  CameraServiceCoordinator.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/26.
//  Copyright © 2021 Zego. All rights reserved.
//

import AVFoundation
import Combine

class CameraServiceCoordinator: ObservableObject, CameraServiceDataOutputDelegate {

    private let service = CameraService()

    @Published var showAlertError = false
    var alertError: AlertError!

    private var subscriptions = Set<AnyCancellable>()

    var previewView = PreviewView()

    init() {

        service.dataOutputDelegete = self

        service.$shouldShowAlertView.sink { [weak self] (val) in
            self?.alertError = self?.service.alertError
            self?.showAlertError = val
        }
        .store(in: &self.subscriptions)
    }

    func configure() {
        service.checkForPermissions()
    }

    func start() {
        service.start()
    }

    func stop() {
        service.stop()
    }

    func flipCamera(completionHandler handler: (() -> Void)? = nil) {
        service.changeCameraPosition(completionHandler: handler)
    }

    func changeResolution(_ preset: ResolutionPreset) {
        service.setResolution(preset)
    }

    // MARK: CameraServiceDataOutputDelegate
    func cameraService(_ output: CameraService, didCapturedBuffer pixelBuffer: CVPixelBuffer, timestamp: CMTime) {
        // We are currently in the camera session queue
        previewView.renderBuffer(pixelBuffer)
    }
}
