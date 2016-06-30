//
//  BaseViewController.m
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property(nonatomic, strong) UIView *hudContainer;
@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    if ([self respondsToSelector:@selector(
                                           setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    
    [self.view setBackgroundColor:[UIColor colorWithHex:0xf2f2f2]];
    [self.navigationController setToolbarHidden:YES];
    
    self.hudContainer = [[UIView alloc]
                         initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
    _hudContainer.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.3];
    _hudContainer.hidden = YES;
    [self.view addSubview:_hudContainer];
}


- (BOOL)isModal {
    if (self.navigationController == nil ||
        self.navigationController.viewControllers.count <= 1) {
        if (self.presentingViewController) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - HUD
- (UIView *)HUDContainer {
    _hudContainer.hidden = NO;
    [self.view bringSubviewToFront:_hudContainer];
    return _hudContainer;
}

- (void)hieHUD:(BOOL)animated {
    UIView *HUDContainer = [self HUDContainer];
    if (animated) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             HUDContainer.hidden = YES;
                         }];
    }
    
    for (JGProgressHUD *v in HUDContainer.subviews) {
        if ([v isKindOfClass:[JGProgressHUD class]]) {
            [v dismissAnimated:animated];
        }
    }
}

- (JGProgressHUD *)showLoading {
    return [self showLoading:nil];
}

- (void)hideLoading {
    [self hieHUD:YES];
}

- (JGProgressHUD *)showLoading:(NSString *)tip {
    JGProgressHUD *HUD = [self getDefaultHUD:tip];
    [HUD showInView:[self HUDContainer]];
    return HUD;
}

- (JGProgressHUD *)showTip:(NSString *)tip {
    return [self showTip:tip delay:2];
}

- (JGProgressHUD *)showTip:(NSString *)tip delay:(double)delay {
    JGProgressHUD *HUD = [self getDefaultHUD:tip];
    HUD.indicatorView = nil;
    [HUD showInView:[self HUDContainer]];
    if (delay > 0) {
        [HUD dismissAfterDelay:delay];
    }
    return HUD;
}

- (JGProgressHUD *)showErrorTip:(NSString *)tip {
    JGProgressHUD *HUD = [self getDefaultHUD:tip];
    HUD.indicatorView = [[JGProgressHUDErrorIndicatorView alloc] init];
    [HUD showInView:[self HUDContainer]];
    [HUD dismissAfterDelay:1];
    return HUD;
}

- (JGProgressHUD *)showSuccessTip:(NSString *)tip {
    JGProgressHUD *HUD = [self getDefaultHUD:tip];
    HUD.indicatorView = [[JGProgressHUDSuccessIndicatorView alloc] init];
    [HUD showInView:[self HUDContainer]];
    [HUD dismissAfterDelay:2];
    return HUD;
}

- (JGProgressHUD *)getDefaultHUD:(NSString *)tip {
    [self hieHUD:NO];
    JGProgressHUD *HUD =
    [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    HUD.square = YES;
    HUD.textLabel.text = tip;
    return HUD;
}

- (void)setBackBarButtonItemWithAction:(SEL)action {
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                   target:nil
                                   action:nil];
    flexSpacer.width = -8 * kScreenRatio;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]
                                 initWithImage:[UIImage imageNamed:@"icon_back_white_normal"]
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:action];
    [self.navigationItem setLeftBarButtonItems:@[ flexSpacer, backItem ]
                                      animated:YES];
}

- (void)setShareBarButtonItemWithAction:(SEL)action {
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                   target:nil
                                   action:nil];
    flexSpacer.width = -8 * kScreenRatio;
    UIBarButtonItem *shareItem =
    [[UIBarButtonItem alloc] initWithTitle:@"分享"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:action];
    [self.navigationItem setRightBarButtonItems:@[ shareItem, flexSpacer ]
                                       animated:YES];
}
@end
