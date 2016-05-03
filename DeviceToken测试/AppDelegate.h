//
//  AppDelegate.h
//  DeviceToken测试
//
//  Created by shoule on 16/5/3.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol appDelegateDeviceToken
- (void)appDelegateReceiveDeviceToken:(NSString *)deviceToken;
@end


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id delegate;

@end

