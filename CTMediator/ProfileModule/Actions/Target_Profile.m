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
    
    void (^successHandler)(UIViewController *)  = params[@"successHandler"];
    void (^failHandler)()                       = params[@"failHandler"];
    if (viewController) {
        !successHandler ? : successHandler(viewController);
    } else {
        !failHandler ? : failHandler();
    }
    
    return viewController;
}

#define CT_PROFILE_SHOULD_LOGIN_ACTION_MAP \
@{ \
@"native1" : @(YES), \
@"native2" : @(NO), \
}

- (id)Action_native1:(NSDictionary *)params {
    return nil;
}

- (id)Action_native2:(NSDictionary *)params {
    return nil;
}

- (BOOL)shouldLoginBeforeAction:(NSString *)actionName {
    return YES;
}
@end
