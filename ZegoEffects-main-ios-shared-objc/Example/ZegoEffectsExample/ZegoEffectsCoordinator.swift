//
//  ZegoEffectsCoordinator.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/26.
//  Copyright © 2021 Zego. All rights reserved.
//

import UIKit
import ZegoEffects

class ZegoEffectsCoordinator: NSObject, ObservableObject {

    private var effects: ZegoEffects?

    private var currentResolutionPreset: ResolutionPreset = .preset720P

    private var isInitialized: Bool = false

    private var chromaKeyParam = ZegoEffectsChromaKeyParam()

    public var faceDetectionRects: [CGRect] = []

    func getVersion() -> String {
        return ZegoEffects.getVersion()
    }

    func initEffects() {
        if isInitialized {
            return
        }

        isInitialized = true

        if let faceDetectionModelPath = Bundle.main.path(forResource: "FaceDetectionModel", ofType: "bundle"),
           let segmentationModelPath = Bundle.main.path(forResource: "SegmentationModel", ofType: "bundle") {

            ZegoEffects.setModels([faceDetectionModelPath, segmentationModelPath])
        }

        effects = ZegoEffects.create(ZegoLicense.effectsLicense)

        effects?
            .setEventHandler(self)
            .initEnv(getResolution(currentResolutionPreset))

        effects?
            .enableSmooth(true)
            .enableFaceDetection(true)
            .enableFaceLifting(true)
            .enableBigEyes(true)

        if let whitenLookUpPath = Bundle.main.path(forResource: "whitening_lookup_1.0.1", ofType: "png") {
            //self.effects?.enableWhiten(true, lookUpTablePath: whitenLookUpPath)
        }
    }

    func uninitEffects() {
        if !isInitialized {
            return
        }

        effects?.destroy()
    }

    func enableChromaKey(_ enable: Bool) {
        effects?
            .enableChromaKey(enable)
            .enableChromaKeyBackground(enable)

        if enable {
            if let backgroundPath = Bundle.main.path(forResource: "background_big_sur", ofType: "jpg") {
                effects?
                    .setChromaKeyBackgroundPath(backgroundPath, mode: .aspectFill)
            }
        }
    }

    func enableSegmentation(_ enable: Bool) {
        effects?
            .enablePortraitSegmentation(enable)
            .enablePortraitSegmentationBackground(enable)

        if enable {
            if let backgroundPath = Bundle.main.path(forResource: "background_big_sur", ofType: "jpg") {
                effects?
                    .setPortraitSegmentationBackgroundPath(backgroundPath, mode: .aspectFill)
            }
        }
    }

    var smoothIntensity: Int = 50 {
        willSet {
            let param = ZegoEffectsSmoothParam()
            param.intensity = Int32(newValue)
            effects?.setSmoothParam(param)
        }
    }

    var whitenIntensity: Int = 50 {
        willSet {
            let param = ZegoEffectsWhitenParam()
            param.intensity = Int32(newValue)
            effects?.setWhitenParam(param)
        }
    }

    var bigEyeIntensity: Int = 50 {
        willSet {
            let param = ZegoEffectsBigEyesParam()
            param.intensity = Int32(newValue)
            effects?.setBigEyesParam(param)
        }
    }

    var faceLiftingIntensity: Int = 50 {
        willSet {
            let param = ZegoEffectsFaceLiftingParam()
            param.intensity = Int32(newValue)
            effects?.setFaceLiftingParam(param)
        }
    }

    var chromaKeySimilarity: Int = 50 {
        willSet {
            chromaKeyParam.similarity = Float(newValue)
            effects?.setChromaKeyParam(chromaKeyParam)
        }
    }

    var chromaKeySmoothness: Int = 50 {
        willSet {
            chromaKeyParam.smoothness = Float(newValue)
            effects?.setChromaKeyParam(chromaKeyParam)
        }
    }

    var chromaKeyOpacity: Int = 50 {
        willSet {
            chromaKeyParam.opacity = Int32(newValue)
            effects?.setChromaKeyParam(chromaKeyParam)
        }
    }

    var chromaKeyColor: Int = 0x00FF00 {
        willSet {
            chromaKeyParam.keyColor = Int32(newValue)
            effects?.setChromaKeyParam(chromaKeyParam)
        }
    }

    var chromaKeyBorderSize: Int = 50 {
        willSet {
            chromaKeyParam.borderSize = Int32(newValue)
            effects?.setChromaKeyParam(chromaKeyParam)
        }
    }

    func processBuffer(_ pixelBuffer: CVPixelBuffer) {
        self.effects?.processImageBuffer(pixelBuffer)
    }

    func changeResolution(_ resolution: ResolutionPreset) {
        currentResolutionPreset = resolution

        // TODO: There's a crash, do not invoke it
        effects?.uninitEnv()
        effects?.initEnv(getResolution(currentResolutionPreset))
    }

    func getResolution(_ preset: ResolutionPreset) -> CGSize {
        var size: CGSize
        switch preset {
        case .preset480p:
            size = CGSize(width: 480, height: 640)
        case .preset540P:
            size = CGSize(width: 540, height: 960)
        case .preset720P:
            size = CGSize(width: 720, height: 1280)
        case .preset1080P:
            size = CGSize(width: 1080, height: 1920)
        }
        return size
    }

}

extension ZegoEffectsCoordinator: ZegoEffectsEventHandler {

    func effects(_ effects: ZegoEffects, errorCode: Int32, desc: String) {
        print("[ZegoEffectsEventHandler] onError: \(errorCode)")
    }

    func effects(_ effects: ZegoEffects, faceDetectionResults results: [ZegoEffectsFaceDetectionResult]) {

        faceDetectionRects = []

        if results.count == 0 {
            return
        }

        for result in results {
            faceDetectionRects.append(result.rect)

//            print("[ZegoEffectsEventHandler] onFaceDetectionResult: score: \(result.score), rect: L:\(result.rect.left), T:\(result.rect.top), R:\(result.rect.right), B:\(result.rect.bottom)")
        }

    }

}
