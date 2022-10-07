//
//  ToolBarView.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/20.
//  Copyright © 2021 Zego. All rights reserved.
//

import SwiftUI
import ZegoEffects

struct ToolBarView: View {

    @State var data: [FeatureItemList]
    @State var sliderValue: Double = 0

    @State var seletedSection: Int = 0
    @State var seletedItem: Int = 0 {
        willSet {
            onItemValueChanged(newItemIndex: newValue)
        }
    }

    @State var didPressedResetButton: Bool = false

    var effects: ZegoEffectsCoordinator

    func onItemValueChanged(newItemIndex: Int) {
        switch data[seletedSection].identifier {
        case "beauty_skin", "beauty_shape":

            // Press reset button
            if didPressedResetButton &&
                data[seletedSection].features[newItemIndex].identifier == "reset" {
                didPressedResetButton = false // Reset value
                for i in 1..<data[seletedSection].features.count {
                    let defaultValue = data[seletedSection].features[i].defaultValue
                    // Reset model value
                    data[seletedSection].features[i].value = defaultValue
                    // Call SDK function to reset value
                    onSliderValueChanged(sectionIndex: seletedSection, itemIndex: i, value: defaultValue)
                }
            }

        case "special_effects":
            switch data[seletedSection].features[newItemIndex].identifier {
            case "no_effects":
                effects.enableChromaKey(false)
                effects.enableSegmentation(false)
            case "chroma_key":
                effects.enableSegmentation(false)
                effects.enableChromaKey(true)
            case "segmentation":
                effects.enableChromaKey(false)
                effects.enableSegmentation(true)
            default:
                break
            }
        default:
            break
        }
    }

    func onSliderValueChanged(sectionIndex: Int, itemIndex: Int, value: Int) {
        data[sectionIndex].features[itemIndex].value = value

        switch data[sectionIndex].features[itemIndex].identifier {
        case "smooth":
            effects.smoothIntensity = value
        case "whiten":
            effects.whitenIntensity = value
        case "face_lifting":
            effects.faceLiftingIntensity = value
        case "big_eyes":
            effects.bigEyeIntensity = value
        case "chroma_key":
            effects.chromaKeySimilarity = value
        default:
            break
        }
    }

    var toolbar: some View {
        ZStack {
            Color(red: 9/255, green: 17/255, blue: 28/255, opacity: 0.8).edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<data.count) { index in
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    seletedSection = index
                                    seletedItem = 0
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    Text(data[index].label)
                                        .font(.system(size: 16.0))
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 8, trailing: 10))
                                        .truncationMode(.middle)
                                        .foregroundColor(
                                            seletedSection == index ?
                                                Color.white : Color(.sRGB, red: 194/255, green: 194/255, blue: 194/255, opacity: 1.0)
                                        )

                                    Color.white
                                        .frame(width: 20, height: 2, alignment: .center)
                                        .opacity(seletedSection == index ? 1.0 : 0.0)
                                }
                            })
                        }
                    }.padding(.horizontal, 10)
                }

                Color(red: 60/255, green: 65/255, blue: 72/255, opacity: 0.4).frame(height: 0.5)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<data[seletedSection].features.count) { index in

                            Button(action: {
                                if index == 0 {
                                    didPressedResetButton = true
                                }
                                seletedItem = index
                                sliderValue = Double(data[seletedSection].features[seletedItem].value)
                            }, label: {
                                VStack(spacing: 5) {
                                    Image(data[seletedSection].features[index].icon)
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(2)
                                        .frame(width: 50, alignment: .center)
                                        .shadow(
                                            color: seletedItem == index && seletedItem != 0 ? .white : .black,
                                            radius: 0
                                    )

                                    Text(data[seletedSection].features[index].label)
                                        .font(.system(size: 9.0))
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                        .foregroundColor(
                                            seletedItem == index && seletedItem != 0 ?
                                                Color.white : Color(.sRGB, red: 194/255, green: 194/255, blue: 194/255, opacity: 1.0)
                                        )
                                }
                            })
                            .frame(width: 65, height: 75, alignment: .center)
                            .contentShape(Rectangle())
                        }

                    }
                    .padding(.all, 10)
                }

                Spacer().frame(height: 10)
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {

            if (data[seletedSection].features[seletedItem].value >= 0) {
                ZStack {
                    Slider(
                        value: Binding<Double>(
                            get: { () -> Double in
                                sliderValue
                            }, set: { (newValue) in
                                sliderValue = newValue
                                onSliderValueChanged(sectionIndex: seletedSection, itemIndex: seletedItem, value: Int(newValue))
                            }
                        ),
                        in: 0...100,
                        step: 1.0
                    )
                    
                    .accentColor(Color.init(.sRGB, red: 252/255, green: 82/255, blue: 75/255, opacity: 1.0))
                    .padding(.horizontal, 50)

                    HStack {
                        Text("\(Int(sliderValue))")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5)
                            .padding(.leading, 15)
                        Spacer()
                    }
                }
            } else {
                Spacer()
            }

            Spacer()

            toolbar.frame(height: 130)

        }
    }
}

struct EffectsToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        let effects = ZegoEffectsCoordinator()
        let feature = FeatureInfo(effects: effects)
        ToolBarView(data: feature.beautySection, effects: effects)
            .frame(height: 185)
    }
}
