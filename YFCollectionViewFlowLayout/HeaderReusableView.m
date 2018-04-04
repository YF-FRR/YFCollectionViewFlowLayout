//
//  HeaderReusableView.m
//  YFPageViewControllerVC
//
//  Created by ios_yangfei on 2017/12/19.
//  Copyright © 2017年 jianghu3. All rights reserved.
//

#import "HeaderReusableView.h"
#import "UIView+Extension.h"

@interface HeaderReusableView()
@property(nonatomic,weak)UILabel *titleLab;
@end

@implementation HeaderReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    
    UILabel *titleLab = [UILabel new];
    [self addSubview:titleLab];
    [titleLab addLayoutConstraint:UIEdgeInsetsZero];
    titleLab.adjustsFontSizeToFitWidth = YES;
    titleLab.textColor = [UIColor redColor];
    self.titleLab = titleLab;
    
}

-(void)setTitleStr:(NSString *)titleStr{
    self.titleLab.text = titleStr;
}

@end
