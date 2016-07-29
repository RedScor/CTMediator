//
//  CTProfileViewController.m
//  CTMediator
//
//  Created by tripleCC on 16/7/29.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTProfileViewController.h"

@interface CTProfileViewController()
@property (strong, nonatomic) UIView *profileView;
@end

@implementation CTProfileViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.profileView];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.profileView.frame = self.view.bounds;
}

#pragma mark getter setter
- (UIView *)profileView
{
    if (_profileView == nil) {
        _profileView = [UIView new];
        _profileView.backgroundColor = [UIColor blueColor];
    }
    
    return _profileView;
}


@end
