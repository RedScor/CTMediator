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
    
    viewController.successHandler = ^{
        /* 设置当前已登陆 */
        [[NSUserDefaults standardUserDefaults] setBool:YES
                                                forKey:kCTIsLoginedKey];
        /* 向CTMediator重新请求原来的动作 */
        [[CTMediator sharedInstance] performTarget:params[@"target"]
                                            action:params[@"action"]
                                            params:params[@"params"]];
    };
    
    [[UIApplication sharedApplication].keyWindow.rootViewController
     presentViewController:viewController animated:YES completion:nil];

    return nil;
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
