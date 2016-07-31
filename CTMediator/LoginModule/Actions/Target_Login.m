//
//  Target_Login.m
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_Login.h"
#import "CTLoginViewController.h"

#import "CTMediator.h"

static NSString *const kCTIsLoginedKey = @"kCTIsLoginedKey";

@implementation Target_Login
- (id)Action_nativePresentLoginViewController:(NSDictionary *)params {
    CTLoginViewController *viewController = [[CTLoginViewController alloc] init];
    
    void (^successHandler)()    = params[@"successHandler"];
    BOOL isLogined = [[NSUserDefaults standardUserDefaults] boolForKey:kCTIsLoginedKey];
    if (!isLogined) {
        /* 没有登录，弹出登录夜，传入登录成功回调 */
        viewController.successHandler = ^{
            /* 设置当前已登陆 */
            [[NSUserDefaults standardUserDefaults] setBool:YES
                                        forKey:kCTIsLoginedKey];
            /* 执行登录成功回调 */
            !successHandler ? : successHandler();
        };
        
        [[UIApplication sharedApplication].keyWindow.rootViewController
         presentViewController:viewController animated:YES completion:nil];
    } else {
        /* 已登陆，直接执行成功回调 */
        !successHandler ? : successHandler();
    }
    
    return viewController;
}

- (id)Action_nativeIsLogined:(NSDictionary *)params {
    return @([[NSUserDefaults standardUserDefaults] boolForKey:kCTIsLoginedKey]);
}

- (UIViewController *)Action_nativeFetchLoginViewController:(NSDictionary *)params {
    CTLoginViewController *viewController = [[CTLoginViewController alloc] init];
    viewController.successHandler = params[@"successHandler"];
    
    return viewController;
}
@end
