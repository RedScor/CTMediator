//
//  CTLoginViewController.m
//  CTMediator
//
//  Created by tripleCC on 16/7/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTLoginViewController.h"

@interface CTLoginViewController()
@property (strong, nonatomic) UIButton *loginDimissButton;
@end

@implementation CTLoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.loginDimissButton];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.loginDimissButton.frame = self.view.bounds;
}

#pragma mark event response
- (void)loginDimissButtonOnClicked:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:^{
        /* 把这一句提到completion外部，就可以得到和淘宝类似效果 */
        !self.resultHandler ? : self.resultHandler(NO);
    }];
}

#pragma mark getter setter
- (UIButton *)loginDimissButton
{
    if (_loginDimissButton == nil) {
        _loginDimissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginDimissButton setTitle:@"dismiss" forState:UIControlStateNormal];
        [_loginDimissButton addTarget:self action:@selector(loginDimissButtonOnClicked:) forControlEvents:UIControlEventTouchDown];
    }
    
    return _loginDimissButton;
}

@end
