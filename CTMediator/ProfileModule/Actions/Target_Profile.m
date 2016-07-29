//
//  Target_Profile.m
//  CTMediator
//
//  Created by tripleCC on 16/7/29.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_Profile.h"

#import "CTProfileViewController.h"

@implementation Target_Profile
- (id)Action_nativeFetchProfileViewController:(NSDictionary *)params {
    CTProfileViewController *viewController = [[CTProfileViewController alloc] init];
    
    /* 登录是否成功，是否有登录回调 */
    void (^successHandler)(UIViewController *)  = params[@"successHandler"];
    void (^failHandler)()                       = params[@"failHandler"];
    if (viewController) {
        !successHandler ? : successHandler(viewController);
    } else {
        !failHandler ? : failHandler();
    }
    
    return viewController;
}

- (BOOL)shouldLoginBeforeAction:(NSString *)actionName {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"];
}
@end
