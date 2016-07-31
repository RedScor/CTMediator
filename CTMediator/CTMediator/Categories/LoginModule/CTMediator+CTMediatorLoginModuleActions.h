//
//  CTMediator+CTMediatorLoginModuleActions.h
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//
#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (CTMediatorLoginModleActions)
- (UIViewController *)CTMediator_nativeViewControllerForLoginWithSuccessHandler:(void(^)())successHandler;
@end
