//
//  ActivityIndicator.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/4/4.
//  Copyright © 2021 Zego. All rights reserved.
//

import SwiftUI


struct ActivityIndicator: View {

    private let count: Int = 8

    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<self.count) { index in
                ActivityIndicatorItem(index: index, count: self.count, size: geometry.size)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

private struct ActivityIndicatorItem: View {

    let index: Int
    let count: Int
    let size: CGSize

    @State private var opacity: Double = 0

    var body: some View {
        let height = size.height / 3.2
        let width = height / 2
        let angle = 2 * .pi / CGFloat(count) * CGFloat(index)
        let x = (size.width / 2 - height / 2) * cos(angle)
        let y = (size.height / 2 - height / 2) * sin(angle)

        let animation = Animation.default
            .repeatForever(autoreverses: true)
            .delay(Double(index) / Double(count) / 2)

        return RoundedRectangle(cornerRadius: width / 2 + 1)
            .frame(width: width, height: height)
            .rotationEffect(Angle(radians: Double(angle + CGFloat.pi / 2)))
            .offset(x: x, y: y)
            .opacity(opacity)
            .onAppear {
                self.opacity = 1
                withAnimation(animation) {
                    self.opacity = 0.3
                }
            }
    }
}
