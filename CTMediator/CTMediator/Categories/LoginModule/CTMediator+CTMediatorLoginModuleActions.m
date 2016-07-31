//
//  CTMediator+CTMediatorLoginModuleActions.m
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator+CTMediatorLoginModuleActions.h"

NSString * const kCTMediatorTargetLogin = @"Login";

NSString * const kCTMediatorActionNativeFetchLoginViewController = @"nativeFetchLoginViewController";
@implementation CTMediator (CTMediatorLoginModleActions)

/* 实际应用时，这个分类可以放在一个单独的Pod中，由对应模块负责人维护 */

/* 调用方传入登录回调 */
- (UIViewController *)CTMediator_nativeViewControllerForLoginWithSuccessHandler:(void(^)())successHandler {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (successHandler) params[@"successHandler"]   = successHandler;
    
    UIViewController *viewController = [self performTarget:kCTMediatorTargetLogin
                                                    action:kCTMediatorActionNativeFetchLoginViewController
                                                    params:params];
    
    return viewController;
}


@end
