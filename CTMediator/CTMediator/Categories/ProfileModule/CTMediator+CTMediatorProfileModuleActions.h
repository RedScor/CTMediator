//
//  CTMediator+CTMediatorProfileModuleActions.h
//  CTMediator
//
//  Created by tripleCC on 16/7/29.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (CTMediatorProfileModuleActions)
- (id)CTMediator_nativeViewControllerForProfileWithSuccessHandler:(void (^)(UIViewController *))successHandler failHandler:(void (^)())failHandler;
@end
