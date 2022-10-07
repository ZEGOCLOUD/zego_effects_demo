//
//  HUD.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/26.
//  Copyright © 2021 Zego. All rights reserved.
//

import SwiftUI

final class HUDState: ObservableObject {
    @Published var isPresented: Bool = false
    private(set) var title: String = ""
    private(set) var systemImage: String = ""

    func show(title: String, systemImage: String) {
        self.title = title
        self.systemImage = systemImage
        withAnimation {
            isPresented = true
        }
    }
}

struct HUD<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(.horizontal, 12)
            .padding(16)
            .background(
                Capsule()
                    .foregroundColor(Color.white)
                    .shadow(color: Color(.black).opacity(0.16), radius: 12, x: 0, y: 5)
            )
    }
}

extension View {
    func hud<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        ZStack(alignment: .top) {
            self

            if isPresented.wrappedValue {
                HUD(content: content)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isPresented.wrappedValue = false
                            }
                        }
                    }
                    .zIndex(1)
            }
        }
    }
}
