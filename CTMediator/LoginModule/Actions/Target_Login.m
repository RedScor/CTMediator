//
//  Target_Login.m
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_Login.h"
#import "CTLoginViewController.h"
//#import "CTMediator.h"
/* 被调用方不要依赖中间件 */

@implementation Target_Login
- (id)Action_nativePresentLoginViewController:(NSDictionary *)params {
    CTLoginViewController *viewController = [[CTLoginViewController alloc] init];
    viewController.resultHandler = ^(BOOL loginSuccess){
        Class targetClass = NSClassFromString(params[@"target"]);
        id target = [[targetClass alloc] init];
        SEL action = NSSelectorFromString(params[@"action"]);
        
        NSMutableDictionary *paramsM = [params[@"params"] mutableCopy];
        paramsM[@"loginSuccess"] = @(loginSuccess);
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action withObject:paramsM];
#pragma clang diagnostic pop
        /* 这里手动执行action */
    };

    [[UIApplication sharedApplication].keyWindow.rootViewController
     presentViewController:viewController animated:YES completion:nil];
    
    return nil;
}

- (UIViewController *)Action_nativeFetchLoginViewController:(NSDictionary *)params {
    CTLoginViewController *viewController = [[CTLoginViewController alloc] init];
    viewController.resultHandler = params[@"resultHandler"];
    
    return viewController;
}
@end
