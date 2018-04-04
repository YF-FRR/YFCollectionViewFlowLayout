//
//  IndexIndicatorCell.m
//  YFPageViewControllerVC
//
//  Created by ios_yangfei on 2017/12/16.
//  Copyright © 2017年 jianghu3. All rights reserved.
//

#import "IndexIndicatorCell.h"
#import "UIView+Extension.h"

@interface IndexIndicatorCell()
@property(nonatomic,weak)UILabel *titleLab;
@property(nonatomic,weak)UILabel *countLab;
@end

@implementation IndexIndicatorCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    
    UILabel *titleLab = [UILabel new];
    [self addSubview:titleLab];
    [titleLab addLayoutConstraint:UIEdgeInsetsZero];
    titleLab.textColor = [UIColor blackColor];
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab = titleLab;
    
    CGFloat w = 15;
    UILabel *countLab = [UILabel new];
    [self addSubview:countLab];
    [countLab mas_constraint:^(UIView *make) {
        make.mas_right = 0;
        make.mas_top = 0;
        make.mas_width = w;
        make.mas_height = w;
    }];
    countLab.textColor = [UIColor whiteColor];
    countLab.font = [UIFont systemFontOfSize:10];
    countLab.textAlignment = NSTextAlignmentCenter;
    countLab.layer.cornerRadius = w/2.0;
    countLab.clipsToBounds = YES;
    countLab.backgroundColor = [UIColor redColor];
    self.countLab = countLab;
    
}

-(void)realoadCellWith:(NSString *)title count:(NSString *)count{
    self.titleLab.text = title;
    self.countLab.hidden = [count intValue] == 0;
    self.countLab.text = count;
    if (self.show_scale_animation) {
        if (self.selected) {
            self.titleLab.transform = CGAffineTransformMakeScale(1.3, 1.3);
        }else{
            self.titleLab.transform = CGAffineTransformIdentity;
        }
    }
    
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected) {
        if (self.show_scale_animation) {
            [UIView animateWithDuration:0.25 animations:^{
                self.titleLab.transform = CGAffineTransformMakeScale(1.3, 1.3);
            }];
        }
        self.titleLab.textColor = [UIColor purpleColor];
    }else{
        if (self.show_scale_animation) {
            [UIView animateWithDuration:0.25 animations:^{
                self.titleLab.transform = CGAffineTransformIdentity;
            }];
        }
        self.titleLab.textColor = [UIColor blackColor];
    }

}

@end
