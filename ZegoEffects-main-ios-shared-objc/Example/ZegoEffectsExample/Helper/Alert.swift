//
//  Alert.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/27.
//  Copyright © 2021 Zego. All rights reserved.
//

import Foundation

public struct AlertError {
    public var title: String = ""
    public var message: String = ""
    public var primaryButtonTitle = "OK"
    public var secondaryButtonTitle: String?
    public var primaryAction: (() -> ())?
    public var secondaryAction: (() -> ())?

    public init(title: String = "", message: String = "", primaryButtonTitle: String = "OK", secondaryButtonTitle: String? = nil, primaryAction: (() -> ())? = nil, secondaryAction: (() -> ())? = nil) {
        self.title = title
        self.message = message
        self.primaryAction = primaryAction
        self.primaryButtonTitle = primaryButtonTitle
        self.secondaryAction = secondaryAction
    }
}
