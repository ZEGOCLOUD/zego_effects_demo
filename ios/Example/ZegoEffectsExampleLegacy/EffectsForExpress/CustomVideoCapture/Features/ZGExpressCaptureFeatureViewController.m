//
//  ZGExpressCaptureFeatureViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/7/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGExpressCaptureFeatureViewController.h"
#import "ZGEffectsOnlyEngineManager.h"
#import <ZegoExpressEngine/ZegoExpressEngine.h>
#import "KeyCenter.h"

@interface ZGExpressCaptureFeatureViewController () <
  ZGCaptureDeviceDataOutputPixelBufferDelegate,
  UIPopoverPresentationControllerDelegate,
  ZegoCustomVideoCaptureHandler,
  ZegoEventHandler>

@property (nonatomic, strong) UIBarButtonItem *advancedSettingButton;
@property (nonatomic, strong) UIBarButtonItem *settingButton;

@end

@implementation ZGExpressCaptureFeatureViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupUI];
  [self setupEffect];
  [self setupCaptureDevice];
  [self setupExpress];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self willUninitEffect];
  
  [self.captureDevice stopCapture];
  [[ZGEffectsOnlyEngineManager shared] uninitEnv];
  
  [self didUninitEffect];
}

- (void)setupUI {
  [self setupNavigationBar];
  
  self.previewView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  self.previewView.backgroundColor = [UIColor orangeColor];
  self.previewView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview: self.previewView];
}

- (void)setupNavigationBar {
  self.advancedSettingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Setting"] style:UIBarButtonItemStylePlain target:self action:@selector(showAdvancedSettingController)];
  
  self.settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Setting"] style:UIBarButtonItemStylePlain target:self action:@selector(showSettingController)];
  
  if ([self advancedSettingController]) {
    self.navigationItem.rightBarButtonItems = @[self.advancedSettingButton, self.settingButton];
  }else {
    self.navigationItem.rightBarButtonItem = self.settingButton;
  }
}

- (void)setupCaptureDevice {
  self.captureDevice = [[ZGCaptureDeviceCamera alloc] initWithPixelFormatType:kCVPixelFormatType_32BGRA];
  self.captureDevice.delegate = self;
}

- (void)setupExpress {
  
  unsigned int appID = [KeyCenter appID];
  NSString *appSign = [KeyCenter appSign];
  
  [ZegoExpressEngine createEngineWithAppID:appID appSign:appSign isTestEnv:true scenario:ZegoScenarioGeneral eventHandler:self];
  
  // Init capture config
  ZegoCustomVideoCaptureConfig *captureConfig = [[ZegoCustomVideoCaptureConfig alloc] init];
  captureConfig.bufferType = ZegoVideoBufferTypeCVPixelBuffer;

  // Enable custom video capture
  [[ZegoExpressEngine sharedEngine] enableCustomVideoCapture:YES config:captureConfig channel:ZegoPublishChannelMain];

  // Set self as custom video capture handler
  [[ZegoExpressEngine sharedEngine] setCustomVideoCaptureHandler:self];
  
  // The engine supports rendering the `preview` when the capture type is CVPixelBuffer.
  [[ZegoExpressEngine sharedEngine] startPreview:[ZegoCanvas canvasWithView:self.previewView]];
  
}

- (void)setupEffect {
  [self willInitEffect];
  
//  self.resolution = CGSizeMake(self.previewView.frame.size.width * 2, self.previewView.frame.size.height * 2);
    self.resolution = CGSizeMake(720, 1280);
  [[ZGEffectsOnlyEngineManager shared] createEffectsWithConfig:nil];
  [[ZGEffectsOnlyEngineManager shared] initEnv:self.resolution];
}

- (void)dealloc {
  // After destroying the engine, you will not receive the `-onStop:` callback, you need to stop the custom video caputre manually.
  [_captureDevice stopCapture];

  ZLog(@"🏳️ Destroy ZegoExpressEngine");
  [ZegoExpressEngine destroyEngine:^{
      // This callback is only used to notify the completion of the release of internal resources of the engine.
      // Developers cannot release resources related to the engine within this callback.
      //
      // In general, developers do not need to listen to this callback.
    ZLog(@"🚩 🏳️ Destroy ZegoExpressEngine complete");
  }];
}

#pragma mark - Settings

- (void)showAdvancedSettingController {
  UIViewController *vc = [self advancedSettingController];
  [self configureAdvancedSettingController:vc];
  
  vc.preferredContentSize = CGSizeMake(250.0, 150.0);
  vc.modalPresentationStyle = UIModalPresentationPopover;
  vc.popoverPresentationController.delegate = self;
  vc.popoverPresentationController.barButtonItem = self.advancedSettingButton;
  vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
  
  [self presentViewController:vc animated:YES completion:nil];
}

- (void)showSettingController {
  UIViewController *vc = [self settingController];
  [self configureSettingController:vc];
  
  vc.preferredContentSize = CGSizeMake(250.0, 150.0);
  vc.modalPresentationStyle = UIModalPresentationPopover;
  vc.popoverPresentationController.delegate = self;
  vc.popoverPresentationController.barButtonItem = self.settingButton;
  vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
  
  [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - ZegoCustomVideoCaptureHandler

// Note: This callback is not in the main thread. If you have UI operations, please switch to the main thread yourself.
- (void)onStart:(ZegoPublishChannel)channel {
  ZLog(@"🚩 🟢 ZegoCustomVideoCaptureHandler onStart, channel: %d", (int)channel);
  [self.captureDevice startCapture];
}

// Note: This callback is not in the main thread. If you have UI operations, please switch to the main thread yourself.
- (void)onStop:(ZegoPublishChannel)channel {
  ZLog(@"🚩 🔴 ZegoCustomVideoCaptureHandler onStop, channel: %d", (int)channel);
  [self.captureDevice stopCapture];
}

#pragma mark - ZGCaptureDeviceDataOutputPixelBufferDelegate
- (void)captureDevice:(id<ZGCaptureDevice>)device didCapturedData:(CMSampleBufferRef)data {
  CVPixelBufferRef buffer = CMSampleBufferGetImageBuffer(data);
  CMTime timestamp = CMSampleBufferGetPresentationTimeStamp(data);
  [[ZGEffectsOnlyEngineManager shared] processImageBuffer:buffer];
  
  [[ZegoExpressEngine sharedEngine] sendCustomVideoCapturePixelBuffer:buffer timestamp:timestamp];
}

#pragma mark - UI Protocol
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self.view endEditing:YES];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
  return UIModalPresentationNone;
}

#pragma mark - Stubs
- (void)willInitEffect {
  
}

- (void)willUninitEffect {
  
}

- (void)didUninitEffect {
  
}

- (UIViewController *)advancedSettingController {
  return nil;
}

- (UIViewController *)settingController {
  return nil;
}

- (void)configureSettingController:(UIViewController *)vc {
  
}

- (void)configureAdvancedSettingController:(UIViewController *)vc {}


@end
