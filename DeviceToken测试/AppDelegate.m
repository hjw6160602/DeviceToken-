//
//  AppDelegate.m
//  temp
//
//  Created by shoule on 16/5/3.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, copy)NSString *deviceToken;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
#ifdef __IPHONE_8_0
    // 注册接收通知的类型
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    [application registerUserNotificationSettings:settings];
    
    // 注册允许接收远程推送通知
    [application registerForRemoteNotifications];
#else
    // 如果是iOS7.0，使用以下方法注册
    [application registerForRemoteNotificationTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound];
#endif
    
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    self.deviceToken = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    self.delegate = self.window.rootViewController;
    if ([self.delegate respondsToSelector:@selector(appDelegateReceiveDeviceToken:)]) {
        [self.delegate appDelegateReceiveDeviceToken:self.deviceToken];
    }
    
    NSLog(@"deviceToken:%@", self.deviceToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError:%@", [error localizedDescription]);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"receive remote notification:%@", userInfo);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
//    远程消息数据格式：
//    {"aps" : {"content-available" : 1},"content-id" : 42}
//
//    执行completionHandler有两个目的
//    1> 系统会估量App消耗的电量，并根据传递的UIBackgroundFetchResult 参数记录新数据是否可用
//    2> 调用完成的处理代码时，应用的界面缩略图会自动更新
//    
//    注意：接收到远程通知到执行完网络请求之间的时间不能超过30秒

//    if (userInfo) {
//        int contentId = [userInfo[@"content-id"] intValue];
//        
//        ViewController *vc = (ViewController *)application.keyWindow.rootViewController;
//        [vc loadDataWithContentID:contentId completion:^(NSArray *dataList) {
//            vc.dataList = dataList;
//            
//            NSLog(@"刷新数据结束");
//            
//            completionHandler(UIBackgroundFetchResultNewData);
//        }];
//    } else {
//        completionHandler(UIBackgroundFetchResultNoData);
//    }
}



@end
