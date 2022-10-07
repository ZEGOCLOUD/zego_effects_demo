//
//  ZGAPITestSettingTableViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/5/7.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGAPITestSettingTableViewController.h"
#import "ZGEffectsOnlyEngineManager.h"
#import "ZegoHudManager.h"

@interface ZGAPITestSettingTableViewController () <UITextFieldDelegate>

// PortraitSegmentation
@property (weak, nonatomic) IBOutlet UISwitch *enablePortraitSegmentationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *enablePortraitSegmentationBackgroundSwitch;
@property (weak, nonatomic) IBOutlet UILabel *currentResolutionPortraitSegmentationLabel;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionPortraitSegmentationX;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionPortraitSegmentationY;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionPortraitSegmentationW;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionPortraitSegmentationH;

// FaceDetection
@property (weak, nonatomic) IBOutlet UISwitch *enableFaceDetectionSwitch;

// FaceLifting
@property (weak, nonatomic) IBOutlet UISwitch *enableFaceLiftingSwitch;
@property (weak, nonatomic) IBOutlet UILabel *faceLiftingIntensityLabel;
@property (weak, nonatomic) IBOutlet UISlider *faceLiftingIntensitySlider;

// Whiten
@property (weak, nonatomic) IBOutlet UISwitch *enableWhitenSwitch;
@property (weak, nonatomic) IBOutlet UILabel *whitenIntensityLabel;
@property (weak, nonatomic) IBOutlet UISlider *whitenIntensitySlider;

// Smooth
@property (weak, nonatomic) IBOutlet UISwitch *enableSmoothSwitch;
@property (weak, nonatomic) IBOutlet UILabel *smoothIntensityLabel;
@property (weak, nonatomic) IBOutlet UISlider *smoothIntensitySlider;

// BigEyes
@property (weak, nonatomic) IBOutlet UISwitch *enableBigEyesSwitch;
@property (weak, nonatomic) IBOutlet UILabel *bigEyesIntensityLabel;
@property (weak, nonatomic) IBOutlet UISlider *bigEyesIntensitySlider;

// ChromaKey
@property (weak, nonatomic) IBOutlet UISwitch *enableChromaKeySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *enableChromaKeyBackgroundSwitch;
@property (weak, nonatomic) IBOutlet UILabel *currentResolutionChromaKeyLabel;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionChromaKeyX;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionChromaKeyY;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionChromaKeyW;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionChromaKeyH;
@property (weak, nonatomic) IBOutlet UILabel *chromaKeySimilarityLabel;
@property (weak, nonatomic) IBOutlet UISlider *chromaKeySimilaritySlider;
@property (weak, nonatomic) IBOutlet UILabel *chromaKeySmoothnessLabel;
@property (weak, nonatomic) IBOutlet UISlider *chromaKeySmoothnessSlider;
@property (weak, nonatomic) IBOutlet UILabel *chromaKeyOpacityLabel;
@property (weak, nonatomic) IBOutlet UISlider *chromaKeyOpacitySlider;
@property (weak, nonatomic) IBOutlet UILabel *chromaKeyBorderSizeLabel;
@property (weak, nonatomic) IBOutlet UISlider *chromaKeyBorderSizeSlider;
@property (weak, nonatomic) IBOutlet UILabel *chromaKeyKeyColorLabel;
@property (weak, nonatomic) IBOutlet UITextField *chromaKeyKeyColorTextField;

@end

@implementation ZGAPITestSettingTableViewController

+ (instancetype)instanceFromStoryboard {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"APITest" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:NSStringFromClass([ZGAPITestSettingTableViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupFaceDetectionUI];
}

#pragma mark - FaceDetection

- (void)setupFaceDetectionUI {
    self.enableFaceDetectionSwitch.on = [[ZGEffectsOnlyEngineManager shared] isFaceDetectionEnabled];
}

- (IBAction)enableFaceDetectionSwitchValueChanged:(UISwitch *)sender {
    [[ZGEffectsOnlyEngineManager shared] enableFaceDetection:sender.on];
}

#pragma mark - ChromaKey

//- (void)setupChromaKeyUI {
//    self.enableChromaKeySwitch.on = [[ZGEffectsOnlyEngineManager shared] isChromaKeyEnabled];
//    self.enableChromaKeyBackgroundSwitch.on = [[ZGEffectsOnlyEngineManager shared] isChromaKeyBackgroundEnabled];
//    self.currentResolutionChromaKeyLabel.text = [NSString stringWithFormat:@"%d x %d", (int)self.currentResolution.width, (int)self.currentResolution.height];
//
//    self.chromaKeySimilaritySlider.value = [[ZGEffectsOnlyEngineManager shared] chromaKeySimilarity];
//    self.chromaKeyOpacitySlider.value = [[ZGEffectsOnlyEngineManager shared] chromaKeyOpacity];
//    self.chromaKeyBorderSizeSlider.value = [[ZGEffectsOnlyEngineManager shared] chromaKeyBorderSize];
//
//    self.chromaKeySimilarityLabel.text = [NSString stringWithFormat:@"Similarity\n%d", (int)[[ZGEffectsOnlyEngineManager shared] chromaKeySimilarity]];
//    self.chromaKeySmoothnessLabel.text = [NSString stringWithFormat:@"Smoothness\n%d", (int)[[ZGEffectsOnlyEngineManager shared] chromaKeySmoothness]];
//    self.chromaKeyOpacityLabel.text = [NSString stringWithFormat:@"Opacity\n%d", [[ZGEffectsOnlyEngineManager shared] chromaKeyOpacity]];
//    self.chromaKeyBorderSizeLabel.text = [NSString stringWithFormat:@"BorderSize\n%d", [[ZGEffectsOnlyEngineManager shared] chromaKeyBorderSize]];
//    self.chromaKeyKeyColorLabel.text = [NSString stringWithFormat:@"KeyColor\n%06X", [[ZGEffectsOnlyEngineManager shared] chromaKeyKeyColor]];
//}


//- (IBAction)enableChromaKeySwitchValueChanged:(UISwitch *)sender {
//    [[ZGEffectsOnlyEngineManager shared] enableChromaKey:sender.on];
//}
//
//- (IBAction)enableChromaKeyBackgroundSwitchValueChanged:(UISwitch *)sender {
//    if (sender.on) {
//        [[ZGEffectsOnlyEngineManager shared] setChromaKeyBackgroundPath:[[NSBundle mainBundle] pathForResource:@"background_big_sur" ofType:@"jpg"]];
//    }
//    [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBackground:sender.on];
//}
//
//- (IBAction)chromaKeyForegroundPositionRectCommitted:(UIButton *)sender {
//    if ([self.foregroundPositionChromaKeyX.text isEqual:@""] ||
//        [self.foregroundPositionChromaKeyY.text isEqual:@""] ||
//        [self.foregroundPositionChromaKeyW.text isEqual:@""] ||
//        [self.foregroundPositionChromaKeyH.text isEqual:@""]) {
//        [ZegoHudManager showMessage:@"Please enter all position rect params!"];
//        return;
//    }
//
//    CGRect rect = CGRectMake([self.foregroundPositionChromaKeyX.text floatValue],
//                             [self.foregroundPositionChromaKeyY.text floatValue],
//                             [self.foregroundPositionChromaKeyW.text floatValue],
//                             [self.foregroundPositionChromaKeyH.text floatValue]);
//
//    [[ZGEffectsOnlyEngineManager shared] setChromaKeyForegroundPosition:rect];
//
//    [ZegoHudManager showMessage:[NSString stringWithFormat:@"Set chroma key foreground position to X:%d, Y:%d, W:%d, H:%d", (int)rect.origin.x, (int)rect.origin.y, (int)rect.size.width, (int)rect.size.height]];
//
//    if (![[ZGEffectsOnlyEngineManager shared] isChromaKeyBackgroundEnabled]) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [ZegoHudManager showMessage:@"You may need to enable chroma key 'Background' to take effect"];
//        });
//    }
//}
//
//- (IBAction)chromaKeySliderValueChanged:(UISlider *)sender {
//    int value = (int)sender.value;
//
//    if (sender == self.chromaKeySimilaritySlider) {
//        if (value == [[ZGEffectsOnlyEngineManager shared] chromaKeySimilarity]) {
//            return;
//        }
//
//        self.chromaKeySimilarityLabel.text = [NSString stringWithFormat:@"Similarity\n%d", value];
//        [[ZGEffectsOnlyEngineManager shared] setChromaKeySimilarity:value];
//
//    } else if (sender == self.chromaKeySmoothnessSlider) {
//        if (value == [[ZGEffectsOnlyEngineManager shared] chromaKeySmoothness]) {
//            return;
//        }
//
//        self.chromaKeySmoothnessLabel.text = [NSString stringWithFormat:@"Smoothness\n%d", value];
//        [[ZGEffectsOnlyEngineManager shared] setChromaKeySmoothness:value];
//
//    } else if (sender == self.chromaKeyOpacitySlider) {
//        if (value == [[ZGEffectsOnlyEngineManager shared] chromaKeyOpacity]) {
//            return;
//        }
//
//        self.chromaKeyOpacityLabel.text = [NSString stringWithFormat:@"Opacity\n%d", value];
//        [[ZGEffectsOnlyEngineManager shared] setChromaKeyOpacity:value];
//
//    } else if (sender == self.chromaKeyBorderSizeSlider) {
//        if (value == [[ZGEffectsOnlyEngineManager shared] chromaKeyBorderSize]) {
//            return;
//        }
//
//        self.chromaKeyBorderSizeLabel.text = [NSString stringWithFormat:@"BorderSize\n%d", value];
//        [[ZGEffectsOnlyEngineManager shared] setChromaKeyBorderSize:value];
//    }
//}
//
//- (IBAction)chromaKeyKeyColorSettingButtonClicked:(UIButton *)sender {
//    unsigned int keyColor;
//    NSScanner* scanner = [NSScanner scannerWithString:self.chromaKeyKeyColorTextField.text];
//    [scanner scanHexInt:&keyColor];
//    if (keyColor < 0 || keyColor >= (256 * 256 * 256)) {
//        [ZegoHudManager showMessage:@"The key color of ChromaKey only support '000000' ~ 'FFFFFF' (RGB hex string)"];
//    } else {
//        self.chromaKeyKeyColorLabel.text = [NSString stringWithFormat:@"KeyColor\n%06X", keyColor];
//        [[ZGEffectsOnlyEngineManager shared] setChromaKeyKeyColor:keyColor];
//    }
//}

@end
