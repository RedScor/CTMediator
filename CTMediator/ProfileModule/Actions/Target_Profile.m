//
//  Target_Profile.m
//  CTMediator
//
//  Created by tripleCC on 16/7/29.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_Profile.h"
#import "CTMediator+CTMediatorLoginModuleActions.h"

#import "CTProfileViewController.h"

@implementation Target_Profile
- (id)Action_nativeFetchProfileViewController:(NSDictionary *)params {
    CTProfileViewController *viewController = [[CTProfileViewController alloc] init];
    
    /* 登录是否成功，是否有登录回调 */
    BOOL loginSuccess = [params[@"loginSuccess"] boolValue];
    void (^loginHandler)(UIViewController *, BOOL) = params[@"loginHandler"];
    if (loginHandler) loginHandler(viewController, loginSuccess);
    
    return viewController;
}

- (BOOL)shouldLoginBeforeAction:(NSString *)actionName {
    /* 可以通过中间件，调用登录模块获取当前是否已登陆来决定返回值 */
    return YES;
}
@end
