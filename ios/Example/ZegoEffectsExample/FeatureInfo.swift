//
//  FeatureInfo.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/20.
//  Copyright © 2021 Zego. All rights reserved.
//

import Foundation
import ZegoEffects

struct FeatureItem: Hashable {
    let identifier: String
    let label: String
    let icon: String
    let defaultValue: Int
    var value: Int
}

struct FeatureItemList: Hashable {
    let identifier: String
    let label: String
    var features: [FeatureItem]
}

class FeatureInfo {

    var effects: ZegoEffectsCoordinator

    init(effects: ZegoEffectsCoordinator) {
        self.effects = effects
    }

    lazy var beautySection = [
        FeatureItemList(
            identifier: "beauty_skin",
            label: NSLocalizedString("beauty_skin", comment: "美肤"),
            features: [
                FeatureItem(identifier: "reset", label: NSLocalizedString("reset", comment: "重置"), icon: "beauty_reset_icon", defaultValue: -1, value: -1),
                FeatureItem(identifier: "smooth", label: NSLocalizedString("smooth", comment: "磨皮"), icon: "beauty_skin_smooth_icon", defaultValue: 50, value: effects.smoothIntensity),
                FeatureItem(identifier: "whiten", label: NSLocalizedString("whiten", comment: "美白"), icon: "beauty_skin_whiten_icon", defaultValue: 50, value: effects.whitenIntensity),
            ]
        ),

        FeatureItemList(
            identifier: "beauty_shape",
            label: NSLocalizedString("beauty_shape", comment: "美型"),
            features: [
                FeatureItem(identifier: "reset", label: NSLocalizedString("reset", comment: "重置"), icon: "beauty_reset_icon", defaultValue: -1, value: -1),
                FeatureItem(identifier: "face_lifting", label: NSLocalizedString("face_lifting", comment: "瘦脸"), icon: "beauty_face_lifting_icon", defaultValue: 50, value: effects.faceLiftingIntensity),
                FeatureItem(identifier: "big_eyes", label: NSLocalizedString("big_eyes", comment: "大眼"), icon: "beauty_big_eyes_icon", defaultValue: 50, value: effects.bigEyeIntensity),
            ]
        )
    ]

    lazy var effectsSection = [
        FeatureItemList(
            identifier: "special_effects",
            label: NSLocalizedString("special_effects", comment: "特效"),
            features: [
                FeatureItem(identifier: "no_effects", label: NSLocalizedString("no_effects", comment: "原图"), icon: "effects_no_effects_icon", defaultValue: -1, value: -1),
                FeatureItem(identifier: "chroma_key", label: NSLocalizedString("chroma_key", comment: "绿幕分割"), icon: "effects_chroma_key_icon", defaultValue: 0, value: effects.chromaKeySimilarity),
                FeatureItem(identifier: "segmentation", label: NSLocalizedString("segmentation", comment: "人像分割"), icon: "effects_segmentaion_icon", defaultValue: -1, value: -1),
            ]
        )
    ]

}
