//
//  PhotoHelper.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/20.
//  Copyright © 2021 Zego. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PhotoHelper: NSObject {

    func writeToPhotoAlbum(image: UIImage, completionHandler handler: @escaping (Bool) -> Void) {
        guard let pngData = image.pngData() else {
            handler(false)
            return
        }

        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {

                PHPhotoLibrary.shared().performChanges({
//                    PHAssetCreationRequest.creationRequestForAsset(from: image)
                    let options = PHAssetResourceCreationOptions()
                    let creationRequest = PHAssetCreationRequest.forAsset()
                    creationRequest.addResource(with: .photo, data: pngData, options: options)
                }, completionHandler: { _, error in
                    if let err = error {
                        print("[PhotoHelper] Error occurred while saving photo to photo library: \(err)")
                    }
                    handler(error == nil ? true : false)
                })
            } else {
                handler(false)
            }
        }


    }
}
