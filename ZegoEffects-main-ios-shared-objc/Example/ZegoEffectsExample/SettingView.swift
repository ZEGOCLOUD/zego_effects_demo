//
//  SettingView.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/25.
//  Copyright © 2021 Zego. All rights reserved.
//

import SwiftUI

struct SettingView: View {

    @ObservedObject var effects: ZegoEffectsCoordinator
    @ObservedObject var camera: CameraServiceCoordinator

    @State private var showResolutionSettingActionSheet = false
    @State private var showVersionInfoAlert = false

    @State var chromaKeyColor: String = ""

    var resolutionCell: some View {
        HStack {
            Button(action: {
                self.showResolutionSettingActionSheet = true
            }, label: {
                Text(NSLocalizedString("resolution", comment: "分辨率"))
                    .foregroundColor(Color(UIColor.systemGray2))
            })
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
        }
        .actionSheet(isPresented: $showResolutionSettingActionSheet) {
            ActionSheet(title: Text(NSLocalizedString("resolution", comment: "分辨率")), buttons:
                            ResolutionPreset.allCases.map { each in
                                .default(Text("\(String(Int(effects.getResolution(each).width))) x \(String(Int(effects.getResolution(each).height)))")) {
                                    camera.changeResolution(each)
                                    effects.changeResolution(each)

                                }
                            }
                            + [.cancel()]
            )
        }
    }

    var versionInfoCell: some View {
        HStack {
            Button(action: {
                self.showVersionInfoAlert = true
            }, label: {
                Text(NSLocalizedString("version_info", comment: "版本信息"))
                    .foregroundColor(Color(UIColor.systemGray2))
            })
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)

        }.alert(isPresented: $showVersionInfoAlert) {
            Alert(title: Text("ZegoEffectsSDK: \(effects.getVersion())"))
        }
    }

    var chromaKeySmoothnessCell: some View {
        HStack {
            Text("CK-Smooth")
            Slider(
                value: Binding<Double>(
                    get: { () -> Double in
                        Double(effects.chromaKeySmoothness)
                    }, set: { (newValue) in
                        effects.chromaKeySmoothness = Int(newValue)
                    }
                ),
                in: 0...100,
                step: 1.0
            )
        }
    }

    var chromaKeyOpacityCell: some View {
        HStack {
            Text("CK-Opacity")
            Slider(
                value: Binding<Double>(
                    get: { () -> Double in
                        Double(effects.chromaKeyOpacity)
                    }, set: { (newValue) in
                        effects.chromaKeyOpacity = Int(newValue)
                    }
                ),
                in: 0...100,
                step: 1.0
            )
        }
    }

    var chromaKeyColorCell: some View {
        HStack {
            Text("CK-Color")
            TextField("0 - 16777215", text: $chromaKeyColor)
                .font(Font.caption)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all, 5)
            Button("Commit") {
                if let i = Int(chromaKeyColor) {
                    if (i < 0 || i > 16777215) {
                        return
                    }
                    print("Set new key color: Hex: 0x\(String(i, radix: 16))")
                    effects.chromaKeyColor = i
                }
            }
        }
    }

    var chromaKeyBorderSizeCell: some View {
        HStack {
            Text("CK-BdSize")
            Slider(
                value: Binding<Double>(
                    get: { () -> Double in
                        Double(effects.chromaKeyBorderSize)
                    }, set: { (newValue) in
                        effects.chromaKeyBorderSize = Int(newValue)
                    }
                ),
                in: 0...100,
                step: 1.0
            )
        }
    }

    var body: some View {
        List {
            resolutionCell

            versionInfoCell

            chromaKeySmoothnessCell

            chromaKeyOpacityCell

            chromaKeyColorCell

            chromaKeyBorderSizeCell
        }
        .listStyle(GroupedListStyle())
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(effects: ZegoEffectsCoordinator(), camera: CameraServiceCoordinator())
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
