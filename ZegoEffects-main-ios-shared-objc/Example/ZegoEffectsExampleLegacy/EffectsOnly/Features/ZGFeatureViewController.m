//
//  ZGFeatureViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFeatureViewController.h"
#import "ZGEffectsOnlyEngineManager.h"
#import "ZegoHudManager.h"

@interface ZGFeatureViewController ()
<
ZGCaptureDeviceDataOutputPixelBufferDelegate,
UIPopoverPresentationControllerDelegate
>
@property (nonatomic, strong) UIBarButtonItem *settingButton;
@property (nonatomic, strong) UIBarButtonItem *captureButton;

@property (nonatomic, strong) UIViewController *settingVC;

@property (nonatomic, strong) NSDate *lastRenderingDate;

@property (nonatomic, assign) CVPixelBufferRef buffer;

@end

@implementation ZGFeatureViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupUI];
  [self setupEffect];
  [self setupCaptureDevice];
}

- (void)viewWillDisappear:(BOOL)animated {
    //暂时先在这个方法里处理
    [super viewWillDisappear:animated];
    
    @autoreleasepool {
        [self willUninitEffect];
        
        [self.captureDevice stopCapture];
        [[ZGEffectsOnlyEngineManager shared] destroyEffects];
        [ZegoItemLibrary reset];
        
        [self didUninitEffect];
    }

}

- (void)dealloc {
    [self willUninitEffect];
    
    [self.captureDevice stopCapture];
    [[ZGEffectsOnlyEngineManager shared] uninitEnv];
    [[ZGEffectsOnlyEngineManager shared] destroyEffects];
    
    [ZegoItemLibrary reset];
    
    [self didUninitEffect];
}

- (void)setupUI {
  [self setupNavigationBar];
  
  self.previewView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  self.previewView.backgroundColor = [UIColor orangeColor];
  self.previewView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview:self.previewView];
}

- (void)setupNavigationBar {
  self.captureButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(captureCurrentRenderingImage)];
  
  self.settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Setting"] style:UIBarButtonItemStylePlain target:self action:@selector(showSettingController)];
  
  self.navigationItem.rightBarButtonItems = @[self.settingButton, self.captureButton];
}

- (void)setupEffect {
  [self willInitEffect];
  
//  self.resolution = CGSizeMake(self.previewView.frame.size.width * 2, self.previewView.frame.size.height * 2);
  self.resolution = CGSizeMake(720, 1280);
  [[ZGEffectsOnlyEngineManager shared] createEffectsWithConfig:nil];
  [[ZGEffectsOnlyEngineManager shared] initEnv:self.resolution];
}

- (void)setupCaptureDevice {
  self.captureDevice = [[ZGCaptureDeviceCamera alloc] initWithPixelFormatType:kCVPixelFormatType_32BGRA];
  self.captureDevice.delegate = self;
  
  [self.captureDevice startCapture];
}

#pragma mark - Settings
- (void)showSettingController {
  if (self.settingVC) {
    return;
  }
  UIViewController *vc = [self settingController];
  self.settingVC = vc;
  [self configureSettingController:vc];
  
  [self addChildViewController:vc];
  [self.view addSubview:vc.view];
  
  [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.equalTo(self.view);
    make.height.mas_equalTo(300);
  }];
}

- (void)captureCurrentRenderingImage {
  CIImage *ciImg = [CIImage imageWithCVImageBuffer:self.buffer];
  UIImage *image = [UIImage imageWithCIImage:ciImg];
  NSData *data = UIImagePNGRepresentation(image);
  NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"capture.png"];
  BOOL ret = [data writeToFile:path atomically:NO];
  
  NSString *msg = @"图片保存失败";
  if (ret) {
    msg = @"图片保存至 tmp/capture.png";
  }
  [ZegoHudManager showMessage:msg];
}

#pragma mark - ZGCaptureDeviceDataOutputPixelBufferDelegate
- (void)captureDevice:(id<ZGCaptureDevice>)device didCapturedData:(CMSampleBufferRef)data {
    @autoreleasepool {
        CVPixelBufferRef buffer = CMSampleBufferGetImageBuffer(data);
        self.buffer = buffer;
        if ([self shouldProcess]) {
          [[ZGEffectsOnlyEngineManager shared] processImageBuffer:buffer];
        }
        [self renderPixelBuffer:buffer];
    }
  
}

- (void)renderPixelBuffer:(CVPixelBufferRef)buffer {
  CIImage *image = [CIImage imageWithCVPixelBuffer:buffer];
  dispatch_async(dispatch_get_main_queue(), ^{
    UIImage *uiImage = [UIImage imageWithCIImage:image];
    self.previewView.image = uiImage;
  });
}

#pragma mark -
- (BOOL)shouldRenderOnInterval {
  return NO;
}

- (BOOL)shouldProcess {
  if (![self shouldRenderOnInterval]) {
    return YES;
  }
  
  if (!self.lastRenderingDate) {
    self.lastRenderingDate = [NSDate date];
    return YES;
  }
  
  NSDate *nowDate = [NSDate date];
  NSTimeInterval itv = [nowDate timeIntervalSinceDate:self.lastRenderingDate];
  NSLog(@"[INV]: %f", itv);
  if (itv * 1000 < self.renderingInterval) {
    return NO;
  }
  self.lastRenderingDate = nowDate;
  return YES;
}

#pragma mark - UI Protocol
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self.view endEditing:YES];
  
  [self.settingVC willMoveToParentViewController:nil];
  [self.settingVC removeFromParentViewController];
  [self.settingVC.view removeFromSuperview];
  
  self.settingVC = nil;
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
  return UIModalPresentationNone;
}

#pragma mark - Stubs
- (void)willInitEffect {
  
}

- (void)willUninitEffect {
  
}

- (void)didUninitEffect {
  
}

- (UIViewController *)settingController {
  return nil;
}

- (void)configureSettingController:(UIViewController *)vc {
  
}

@end
