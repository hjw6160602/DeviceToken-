//
//  ViewController.m
//  DeviceToken测试
//
//  Created by shoule on 16/5/3.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController () <appDelegateDeviceToken>
@property (weak, nonatomic) IBOutlet UILabel *deviceTokenLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)appDelegateReceiveDeviceToken:(NSString *)deviceToken{
    self.deviceTokenLabel.text = deviceToken;
}

@end
