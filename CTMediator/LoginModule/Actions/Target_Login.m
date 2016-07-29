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

/* 被调用方不要依赖中间件 */

@implementation Target_Login
- (id)Action_nativePresentLoginViewController:(NSDictionary *)params {
    CTLoginViewController *viewController = [[CTLoginViewController alloc] init];
    viewController.successHandler = ^{
        [[CTMediator sharedInstance] performTarget:params[@"target"]
                                            action:params[@"action"]
                                            params:params[@"params"]];
    };

    [[UIApplication sharedApplication].keyWindow.rootViewController
     presentViewController:viewController animated:YES completion:nil];
    
    return nil;
}

- (UIViewController *)Action_nativeFetchLoginViewController:(NSDictionary *)params {
    CTLoginViewController *viewController = [[CTLoginViewController alloc] init];
    viewController.successHandler = params[@"successHandler"];
    
    return viewController;
}
@end
