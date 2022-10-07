//
//  PhotoHelper.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/20.
//  Copyright © 2021 Zego. All rights reserved.
//

import Foundation
import Combine
import AVFoundation
import UIKit

public enum ResolutionPreset: CaseIterable {
    case preset480p
    case preset540P
    case preset720P
    case preset1080P
}

public protocol CameraServiceDataOutputDelegate: class {
    func cameraService(_ output: CameraService, didCapturedBuffer pixelBuffer: CVPixelBuffer, timestamp: CMTime)
}

public class CameraService: NSObject {

    @Published public var shouldShowAlertView = false

    // Use 30 FPS as default
    private var videoFramerate: UInt32 = 30

    // Use 720p as default
    private var sessionPreset: AVCaptureSession.Preset = .iFrame1280x720

    // Use front camera as default
    private var cameraPosition: AVCaptureDevice.Position = .front

    private var captureDeviceStored: AVCaptureDevice?
    private var captureDevice: AVCaptureDevice? {
        get {
            if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: cameraPosition) {
                captureDeviceStored = device
                return captureDeviceStored
            }
            return nil
        }
    }

    private var deviceInputStored: AVCaptureDeviceInput?
    private var deviceInput: AVCaptureDeviceInput? {
        get {
            if let device = captureDevice {
                do {
                    deviceInputStored = try AVCaptureDeviceInput(device: device)
                    return deviceInputStored
                } catch {
                    print("Create AVCaptureDeviceInput failed: \(error)")
                    return nil
                }
            }
            print("Get AVCaptureDeviceInput before create AVCaptureDevice")
            return nil
        }
    }

    private var deviceOutputStored: AVCaptureVideoDataOutput?
    private var deviceOutput: AVCaptureVideoDataOutput? {
        get {
            if deviceOutputStored == nil {
                deviceOutputStored = AVCaptureVideoDataOutput()
                deviceOutputStored!.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
                deviceOutputStored!.setSampleBufferDelegate(self, queue: sessionQueue)
            }
            return deviceOutputStored
        }
    }
    

    public var alertError: AlertError = AlertError()

    public let session = AVCaptureSession()

    var setupResult: SessionSetupResult = .success

    // Communicate with the session and other session objects on this queue.
    private let sessionQueue = DispatchQueue(label: "im.zego.CameraService.sessionQueue")

    // MARK: Buffer data output
    public weak var dataOutputDelegete: CameraServiceDataOutputDelegate?

    
    // MARK: Checks for user's permisions
    public func checkForPermissions() {
      
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // The user has previously granted access to the camera.
            break
        case .notDetermined:
            /*
             The user has not yet been presented with the option to grant
             video access. Suspend the session queue to delay session
             setup until the access request has completed.
             */
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                if !granted {
                    self.setupResult = .notAuthorized
                }
                self.sessionQueue.resume()
            })
            
        default:
            // The user has previously denied access.
            setupResult = .notAuthorized
            
            DispatchQueue.main.async {
                self.alertError = AlertError(title: NSLocalizedString("camera_access", comment: "相机权限"),
                                             message: "ZegoEffectsExample doesn't have access to use your camera, please update your privacy settings.",
                                             primaryButtonTitle: NSLocalizedString("setting", comment: "设置"),
                                             secondaryButtonTitle: nil,
                                             primaryAction: {
                                                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                                  options: [:], completionHandler: nil)},
                                             secondaryAction: nil)

                self.shouldShowAlertView = true
            }
        }
    }

    public func start(completionHandler handler: (() -> Void)? = nil) {

        sessionQueue.async(qos: .userInteractive) { [self] in

            if session.isRunning {
                if let completionHandler = handler { completionHandler() }
                return
            }

            switch self.setupResult {
            case .success:
                break
            case .configurationFailed, .notAuthorized:
                print("[Camera] Application not authorized to use camera")

                DispatchQueue.main.async {
                    self.alertError = AlertError(title: "Camera Error",
                                                 message: "Camera configuration failed. Either your device camera is not available or its missing permissions",
                                                 primaryButtonTitle: "OK",
                                                 secondaryButtonTitle: nil,
                                                 primaryAction: nil,
                                                 secondaryAction: nil)
                    self.shouldShowAlertView = true
                }
            }

            session.beginConfiguration()

            // MARK: Set resolution
            if session.canSetSessionPreset(sessionPreset) {
                session.sessionPreset = sessionPreset
            } else if (session.canSetSessionPreset(.hd1280x720)) {
                session.sessionPreset = .hd1280x720
                print("Camera session does not support \(sessionPreset), change to hd1280x720")
            } else {
                print("Camera session does not support \(sessionPreset), use default preset")
            }

            // MARK: Set camera device input/output
            if let input = deviceInput, let output = deviceOutput {
                if session.canAddInput(input) {
                    session.addInput(input)
                }

                if session.canAddOutput(output) {
                    session.addOutput(output)
                }

                if let connection = output.connection(with: .video) {
                    // Mirror the video when using the front camera
                    if input.device.position == .front && connection.isVideoMirroringSupported {
                        connection.isVideoMirrored = true
                    }

                    if connection.isVideoOrientationSupported {
                        connection.videoOrientation = .portrait
                    }
                }
            }

            // MARK: Set framerate
            if let device = captureDeviceStored {
                if let range = device.activeFormat.videoSupportedFrameRateRanges.first {
                    if videoFramerate <= UInt(range.maxFrameRate) && videoFramerate >= UInt(range.minFrameRate) {
                        do {
                            try device.lockForConfiguration()
                            device.activeVideoMinFrameDuration = CMTime(value: 1, timescale: CMTimeScale(videoFramerate))
                            device.activeVideoMaxFrameDuration = CMTime(value: 1, timescale: CMTimeScale(videoFramerate))
                            device.unlockForConfiguration()
                            print("[Camera] Set framerate to \(videoFramerate)")
                        } catch {}
                    } else {
                        print("[Camera] Unsupport framerate: \(videoFramerate), range is \(range.minFrameRate) ~ \(range.maxFrameRate)")
                    }
                }
            }

            // MARK: Start camera
            session.commitConfiguration()
            session.startRunning()

            if let completionHandler = handler {
                completionHandler()
            }
        }
    }

    public func stop() {
        sessionQueue.async(qos: .userInteractive) { [self] in
            if !session.isRunning {
                return
            }

            session.stopRunning()
            if let input = deviceInputStored {
                session.removeInput(input)
            }
        }
    }

    public func setFramerate(_ framerate: UInt) {

        if framerate != videoFramerate {
            videoFramerate = UInt32(framerate)
            if session.isRunning {
                self.stop()
                self.start()
            }
        }

    }

    /// Change camera position, if set ".unspecified", it will auto switch front/back
    /// - Parameter position: The new position to be switch to
    public func changeCameraPosition(_ position: AVCaptureDevice.Position = .unspecified, completionHandler handler: (() -> Void)? = nil) {

        let originPosition = cameraPosition

        switch position {
        case .front:
            cameraPosition = .front
        case .back:
            cameraPosition = .back
        case .unspecified:
            // Auto switch
            if originPosition == .front {
                cameraPosition = .back
            } else {
                cameraPosition = .front
            }
        default:
            // Unknown position
            break
        }

        // If the position changed, restart camera
        if session.isRunning && originPosition != cameraPosition {
            self.stop()
            self.start(completionHandler: handler)
        }
    }


    public func setResolution(_ preset: ResolutionPreset) {

        let originPreset = sessionPreset

        switch preset {
        case .preset480p:
            sessionPreset = .vga640x480
        case .preset540P:
            sessionPreset = .iFrame960x540
        case .preset720P:
            sessionPreset = .hd1280x720
        case .preset1080P:
            sessionPreset = .hd1920x1080
        }

        // If the resolution preset changed, restart camera
        if session.isRunning && originPreset != sessionPreset {
            self.stop()
            self.start()
        }
    }

}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension CameraService: AVCaptureVideoDataOutputSampleBufferDelegate {
    public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {

        let timestamp: CMTime = CMSampleBufferGetPresentationTimeStamp(sampleBuffer)
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        // We are currently in the camera session queue
        self.dataOutputDelegete?.cameraService(self, didCapturedBuffer: pixelBuffer, timestamp: timestamp)
    }
}

extension CameraService {
    enum SessionSetupResult {
        case success
        case notAuthorized
        case configurationFailed
    }
}
