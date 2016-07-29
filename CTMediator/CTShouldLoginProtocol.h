//
//  CTShouldLoginProtocol.h
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#ifndef CTShouldLoginProtocol_h
#define CTShouldLoginProtocol_h
#import <Foundation/Foundation.h>

@protocol CTShouldLoginProtocol <NSObject>

- (BOOL)shouldLoginBeforeAction:(NSString *)actionName;

@end


#endif /* CTShouldLoginProtocol_h */
