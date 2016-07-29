//
//  CTMediator+CTMediatorProfileModuleActions.m
//  CTMediator
//
//  Created by tripleCC on 16/7/29.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator+CTMediatorProfileModuleActions.h"

NSString * const kCTMediatorTargetProfile = @"Profile";

NSString * const kCTMediatorActionNativeFetchProfileViewController = @"nativeFetchProfileViewController";

@implementation CTMediator (CTMediatorProfileModuleActions)
/* 个人中心页面需要登录后才能操作，所以传入没有登录时的处理回调
 * 如果不需要知道是否登录，回调直接传入nil，获取返回的个人中心控制器即可
 */
- (id)CTMediator_nativeViewControllerForProfileWithLoginHandler:(void (^)(UIViewController *, BOOL))loginHandler {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (loginHandler) params[@"loginHandler"] = loginHandler;
    
    UIViewController *viewController = [self performTarget:kCTMediatorTargetProfile
                                                    action:kCTMediatorActionNativeFetchProfileViewController
                                                    params:params];
    return viewController;
}
@end
