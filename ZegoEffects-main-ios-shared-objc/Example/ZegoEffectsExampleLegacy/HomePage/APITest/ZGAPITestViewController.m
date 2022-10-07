//
//  ZGAPITestViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/5/7.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGAPITestViewController.h"
#import "ZGAPITestSettingTableViewController.h"
#import "ZGCaptureDeviceCamera.h"
#import "ZGEffectsOnlyEngineManager.h"

@interface ZGAPITestViewController () <ZGCaptureDeviceDataOutputPixelBufferDelegate, UIPopoverPresentationControllerDelegate>

@property (nonatomic, assign) CGSize resolution;

@property (weak, nonatomic) IBOutlet UIImageView *previewView;
@property (nonatomic, strong) UIBarButtonItem *settingButton;

@property (nonatomic, strong) id<ZGCaptureDevice> captureDevice;

@end

@implementation ZGAPITestViewController

+ (instancetype)instanceFromStoryboard {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"APITest" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:NSStringFromClass([ZGAPITestViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

    self.resolution = CGSizeMake(self.previewView.frame.size.width * 2, self.previewView.frame.size.height * 2);

    // Create effects instance
    [[ZGEffectsOnlyEngineManager shared] createEffectsWithConfig:nil];
    [[ZGEffectsOnlyEngineManager shared] initEnv:self.resolution];

    self.captureDevice = [[ZGCaptureDeviceCamera alloc] initWithPixelFormatType:kCVPixelFormatType_32BGRA];
    self.captureDevice.delegate = self;
    [self.captureDevice startCapture];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.captureDevice stopCapture];
    [[ZGEffectsOnlyEngineManager shared] uninitEnv];
}

- (void)dealloc {
    // Destroy effects instance
    [[ZGEffectsOnlyEngineManager shared] destroyEffects];
    
    
    
    
}

#pragma mark - ZGCaptureDeviceDataOutputPixelBufferDelegate

- (void)captureDevice:(id<ZGCaptureDevice>)device didCapturedData:(CMSampleBufferRef)data {
    CVPixelBufferRef buffer = CMSampleBufferGetImageBuffer(data);

    // In-place processing
    [[ZGEffectsOnlyEngineManager shared] processImageBuffer:buffer];

    // Render to image
    [self renderPixelBuffer:buffer];
}

- (void)setupUI {
    // Set a colorful background, to demonstrate the portrait segmentation effect
    self.previewView.backgroundColor = [UIColor orangeColor];
    self.previewView.contentMode = UIViewContentModeScaleAspectFit;

    self.settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Setting"] style:UIBarButtonItemStylePlain target:self action:@selector(showSettingController)];
    self.navigationItem.rightBarButtonItem = self.settingButton;

    self.title = @"API Test";
}

- (void)showSettingController {
    ZGAPITestSettingTableViewController *vc = [ZGAPITestSettingTableViewController instanceFromStoryboard];
    vc.preferredContentSize = CGSizeMake(250.0, 200.0);
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.popoverPresentationController.delegate = self;
    vc.popoverPresentationController.barButtonItem = self.settingButton;
    vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    vc.currentResolution = self.resolution;

    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Render

- (void)renderPixelBuffer:(CVPixelBufferRef)buffer {
    CIImage *image = [CIImage imageWithCVPixelBuffer:buffer];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImage *uiImage = [UIImage imageWithCIImage:image];
        self.previewView.image = uiImage;
    });
}

#pragma mark - UI Protocol

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
