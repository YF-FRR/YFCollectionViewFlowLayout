//
//  IndexIndicatorCell.h
//  YFPageViewControllerVC
//
//  Created by ios_yangfei on 2017/12/16.
//  Copyright © 2017年 jianghu3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexIndicatorCell : UICollectionViewCell
-(void)realoadCellWith:(NSString *)title count:(NSString *)count;
@property(nonatomic,assign)BOOL show_scale_animation;// 是否显示缩放动画
@end
