//
//  ContentView.swift
//  ZegoEffectsExample
//
//  Created by Patrick Fu on 2021/3/1.
//  Copyright © 2021 Zego. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var effects = ZegoEffectsCoordinator()
    @ObservedObject var camera = CameraServiceCoordinator()

    var featureInfo: FeatureInfo {
        get {
            FeatureInfo(effects: effects)
        }
    }

    @State var showSideBar = true
    @State var showBeautyToolBar = false
    @State var showEffectsToolBar = false
    @State var showSaveImageToolBar = false

    @State var isFlipCameraAvailable = true

    @State var showNoPhotoLibraryAccessError = false
    @State var showSettingView = false


    // MARK: - Button Views

    var captureButton: some View {
        Button(action: {
            camera.previewView.stopRendering = true
            showSideBar = false
            showSaveImageToolBar = true
        }, label: {
            Image("main_capture_icon")
                .renderingMode(.original)
        })
    }

    var captureSaveButton: some View {
        Button(action: {
            camera.previewView.saveImageToPhotoLibrary { success in
                camera.previewView.stopRendering = false
                showSideBar = true
                showSaveImageToolBar = false
                if !success {
                    showNoPhotoLibraryAccessError = true
                }
            }
        }, label: {
            Image("capture_save_icon")
                .renderingMode(.original)
        })
    }

    var captureBackButton: some View {
        Button(action: {
            camera.previewView.stopRendering = false
            showSideBar = true
            showSaveImageToolBar = false
        }, label: {
            Image("capture_back_icon")
                .renderingMode(.original)
        })
    }

    var flipCameraButton: some View {
        VStack(spacing: 0) {
            Button(action: {
                self.isFlipCameraAvailable = false
                camera.flipCamera {
                    self.isFlipCameraAvailable = true
                }
            }, label: {
                Image("main_func_switch_camera_icon")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
            })
            .disabled(!self.isFlipCameraAvailable)
            .padding(.horizontal, 10)

            Text(NSLocalizedString("flip", comment: "翻转"))
                .font(.system(size: 10.0))
                .foregroundColor(.white)
                .padding(0)
        }
    }

    var showBeautyToolBarButton: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.showBeautyToolBar = true
                    self.showEffectsToolBar = false
                }
            }, label: {
                Image("main_func_beauty_icon")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
            })
            .padding(.horizontal, 10)

            Text(NSLocalizedString("beauty", comment: "美颜"))
                .font(.system(size: 10.0))
                .foregroundColor(.white)
                .padding(0)
        }
    }

    var showEffectsToolBarButton: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.showEffectsToolBar = true
                    self.showBeautyToolBar = false
                }
            }, label: {
                Image("main_func_effects_icon")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
            })
            .padding(.horizontal, 10)

            Text(NSLocalizedString("special_effects", comment: "特效"))
                .font(.system(size: 10.0))
                .foregroundColor(.white)
                .padding(0)
        }
    }

    var settingButton: some View {
        VStack(spacing: 0) {

            Button {
                self.showSettingView = true
            } label: {
                Image("main_func_setting_icon")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.horizontal, 10)
            }
            .sheet(isPresented: $showSettingView) {
                SettingView(effects: effects, camera: camera)
                    .opacity(0.6)
                    .background(BackgroundClearView())
            }

            Text(NSLocalizedString("setting", comment: "设置"))
                .font(.system(size: 10.0))
                .foregroundColor(.white)
                .padding(0)
        }
    }

    var compareButton: some View {
        Image("main_compare_icon")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30, alignment: .center)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ _ in
                        camera.previewView.renderOriginBuffer = true
                    })
                    .onEnded({ _ in
                        camera.previewView.renderOriginBuffer = false
                    })
            )
    }

    // MARK: - Camera Preview View

    var previewView: some View {
        GeometryReader { reader in
            camera.previewView
                .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                .onAppear {

                    // Init effects
                    effects.initEffects()

                    // Init camera
                    camera.previewView.effectsCoordinator = effects
                    camera.configure()
                    camera.start()
                }
                .alert(isPresented: $camera.showAlertError, content: {
                    Alert(title: Text(camera.alertError.title), message: Text(camera.alertError.message), dismissButton: .default(Text(camera.alertError.primaryButtonTitle), action: {
                        camera.alertError.primaryAction?()
                    }))
                })
                .alert(isPresented: $showNoPhotoLibraryAccessError) { () -> Alert in
                    Alert(
                        title: Text(NSLocalizedString("can_not_save", comment: "无法保存")),
                        message: Text(NSLocalizedString("photo_access_guide", comment: "打开相册权限的指引文案")),
                        dismissButton: .default(Text(NSLocalizedString("ok", comment: "好")))
                    )
                }
                .allowsHitTesting(false)
        }
    }

    var activityIndicatorView: some View {
        ZStack {
            if !isFlipCameraAvailable {
                ActivityIndicator()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white)
            }
        }
    }

    // MARK: - Tools View

    var sideBarView: some View {
        VStack {
            Spacer().frame(height: 15)
            HStack {
                Spacer()
                VStack(spacing: 20) {
                    flipCameraButton
                    showBeautyToolBarButton
                    showEffectsToolBarButton
                    settingButton
                }
                .padding(.all, 20)
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.showBeautyToolBar = false
                self.showEffectsToolBar = false
            }
        }
    }

    var toolBarView: some View {
        Group {
            if (self.showBeautyToolBar) {
                ZStack {
                    ToolBarView(data: featureInfo.beautySection, effects: effects)
                    VStack {
                        HStack {
                            Spacer()
                            compareButton
                                .padding(.trailing, 10)
                        }
                        Spacer()
                    }
                }.frame(height: 185)
            } else if (self.showEffectsToolBar) {
                ZStack {
                    ToolBarView(data: featureInfo.effectsSection, effects: effects)
                    VStack {
                        HStack {
                            Spacer()
                            compareButton
                                .padding(.trailing, 10)
                        }
                        Spacer()
                    }
                }.frame(height: 185)
            } else if (self.showSaveImageToolBar) {
                ZStack {
                    captureSaveButton
                    HStack {
                        captureBackButton
                        Spacer()
                    }.padding(.all, 40)
                }.frame(height: 185)
            } else {
                ZStack {
                    captureButton
                    HStack {
                        Spacer()
                        compareButton
                    }.padding(.all, 20)
                }.frame(height: 185)
            }
        }
    }

    // MARK: - Body

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                previewView.edgesIgnoringSafeArea(.all)

                activityIndicatorView

                VStack {

                    if showSideBar {
                        sideBarView
                    } else {
                        Spacer()
                    }

                    toolBarView
                }

            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
