//
//  LeftView.m
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LeftView.h"
@interface LeftView()

@end
@implementation LeftView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
       
      
        _tableView=[[BKTableView alloc]init];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"zz1"]];
        [self.tableView setBackgroundView:view];
        
       [self addSubview:_tableView];
        
        _headView=[[UIView alloc]init];
        
        _headView.frame=CGRectMake(0, 0, frame.size.width, kSizeFrom720(300));
        [self.tableView setHeadView:_headView];
        
        _headImage=[[UIImageView alloc]init];
        _headImage.image=[UIImage imageNamed:@"login_QQ_icon_click"];
        [_headView addSubview:_headImage];
        
        _lableName=[[UILabel alloc]init];
        _lableName.text=@"哈卡大酒店";
        [_headView addSubview:_lableName];
        
        _lableMoney=[[UILabel alloc]init];
//        _lableMoney.text=@"现金：￥123214244"
        NSString *text=@"现金:￥123214244";
        NSMutableAttributedString *str=[[NSMutableAttributedString alloc]initWithString:text];
        [text enumerateStringsMatchedByRegex:@"\\￥.*$" usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:*capturedRanges];
          
        }];
        _lableMoney.attributedText=str;
        [_headView addSubview:_lableMoney];
        
        _withdrawButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_withdrawButton setTitle:@"提现" forState:UIControlStateNormal];
        [_withdrawButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _withdrawButton.titleLabel.font=[UIFont systemFontOfSize:18];
        _withdrawButton.layer.borderWidth=1;
        _withdrawButton.layer.borderColor=[UIColor grayColor].CGColor;
        [_headView addSubview:_withdrawButton];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _tableView.frame=CGRectMake(0, 0, ViewWidth-50, ViewHeight);
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(kSizeFrom720(40));
        make.centerY.equalTo(_headView.centerY).offset(-kSizeFrom720(20));
        make.width.equalTo(kSizeFrom720(150));
        make.height.equalTo(kSizeFrom720(150));
    }];
    [_lableName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImage.right).offset(kSizeFrom720(40));
        make.top.equalTo(_headImage.top).offset(kSizeFrom720(20));
        make.width.equalTo(kSizeFrom720(200));
        make.height.equalTo(kSizeFrom720(40));
    }];
    
    
    
    [_lableMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(kSizeFrom720(40));
        make.bottom.equalTo(_headView.bottom).offset(-kSizeFrom720(20));
        make.width.equalTo(kSizeFrom720(350));
        make.height.equalTo(kSizeFrom720(60));
    }];
    [_withdrawButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lableMoney.right).offset(kSizeFrom720(80));
        make.top.equalTo(_lableMoney.top);
        make.width.equalTo(kSizeFrom720(100));
        make.height.equalTo(kSizeFrom720(60));
    }];

}
@end
