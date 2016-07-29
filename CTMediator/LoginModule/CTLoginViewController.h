//
//  CTLoginViewController.h
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CTLoginViewController : UIViewController
@property (copy, nonatomic) void (^resultHandler)(BOOL);
@end
