//
//  BaseWebController.m
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BaseWebController.h"

@interface BaseWebController ()<UIWebViewDelegate>
{
     UILabel *_titleLabel;
     BOOL _viewAppeared;
    
    
    UIView *_topView;
    UIButton *_leftButton;
}

@end

@implementation BaseWebController

- (instancetype)init {
    self = [super init];
    if (self) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        self.navigationItem.titleView = _titleLabel;
    }
    return self;
}

- (void)loadView {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    _webView = [UIWebView new];
    _webView.delegate = self;
    self.view = _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.title.length == 0) {
        self.title = @"加载中...";
    }
    
    [_webView loadRequest:[self creatRequest]];
    [self showLoading];

    [_webView reload];
    [self setShareBarButtonItemWithAction:@selector(shareItemClicked)];
    [self Navgitionbar];
}
#pragma mark 导航栏定制
-(void)Navgitionbar
{
    _topView=[UIView new];
    _topView.frame=CGRectMake(20, 20, kScreenWidth, 44);
    [self.view addSubview:_topView];
    _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame=CGRectMake(0, 0, 44, 44);
    [_leftButton setTitle:@"设置" forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_leftButton];
    
}
-(void)leftButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)shareItemClicked
{
    XXLog(@"1232");

}
- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    //    [super setTitle:title];
}

- (void)setTitleString:(NSString *)titleString {
    if (titleString.length > 0) {
        _titleString = titleString;
    }
    if (_viewAppeared ==NO) {
        self.title = _titleString;
    }
}


- (NSMutableURLRequest *)creatRequest {
    NSMutableURLRequest *request = nil;
    if (_urlString.length > 0) {
        request = [NSMutableURLRequest
                   requestWithURL:[NSURL URLWithString:self.urlString]];
    }
    return request;
}
- (void)backItemClicked {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        return;
    }
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
   
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.titleString = @"加载中...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
   
    NSString *webTitle =
    [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.titleString = webTitle;
    if ([_webView canGoBack]) {
        [self setBackBarButtonItemWithAction:@selector(backItemClicked)];
    } else {
        self.titleString = self.rootTitle;
//        self.navigationItem.leftBarButtonItems = nil;
    }
     [self hideLoading];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    self.titleString = @"加载网页失败";
    [self hideLoading];
}


@end
