//
//  UIView+Extension.h
//  baocmsAPP
//
//  Created by Apple on 16/1/3.
//  Copyright © 2016年 jianghu3. All rights reserved.
//
//

#import <UIKit/UIKit.h>

typedef void(^ConstraintMake)(UIView *make);

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat mas_top;
@property (nonatomic, assign) CGFloat mas_left;
@property (nonatomic, assign) CGFloat mas_bottom;
@property (nonatomic, assign) CGFloat mas_right;
@property (nonatomic, assign) CGFloat mas_width;
@property (nonatomic, assign) CGFloat mas_height;

-(void)addLayoutConstraint:(UIEdgeInsets)edgeInset;
-(void)mas_constraint:(ConstraintMake)constraintMake;
@end
