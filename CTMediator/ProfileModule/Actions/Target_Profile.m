//
//  Target_Profile.m
//  CTMediator
//
//  Created by tripleCC on 16/7/29.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_Profile.h"

#import "CTProfileViewController.h"

/* 保存哪些action是需要登录态的 */
static const NSDictionary *CTProfileShouldLoginActionMap;

@implementation Target_Profile
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CTProfileShouldLoginActionMap = @{@"nativeFetchProfileViewController": @(YES),
                                          @"native1" : @(YES),
                                          @"native2" : @(NO),
                                          };
    });
}

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

- (id)Action_native1:(NSDictionary *)params {
    
    return nil;
}

- (id)Action_native2:(NSDictionary *)params {
    
    return nil;
}

- (BOOL)shouldLoginBeforeAction:(NSString *)actionName {
    NSAssert(actionName, @"action name can't be nil");
    
    return [CTProfileShouldLoginActionMap[actionName] boolValue];
}
@end
