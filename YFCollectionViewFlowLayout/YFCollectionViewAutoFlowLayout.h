//
//  YFCollectionViewAutoFlowLayout.h
//  JHCommunityClient
//
//  Created by ios_yangfei on 17/4/8.
//  Copyright © 2017年 JiangHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YFCollectionViewAutoFlowLayoutDelegate <NSObject>

@required
/**
 *  每个item的尺寸
 *
 *  @param indexPath 所在的分组
 *
 *  @return item的尺寸
 */
-(CGSize)collectionViewItemSizeForIndexPath:(NSIndexPath *)indexPath;

@optional
/**
 每个section的headerView的大小

 @param section 分区
 @return 返回section的headerView的大小
 */
-(CGSize)collectionViewSectionHeadSizeForSection:(NSInteger)section;

@end

typedef NS_ENUM(NSUInteger, ItemSizeType) {
    ItemSizeEqualHeight = 0,
    ItemSizeEqualWidth,
    ItemSizeEqualAll,// 宽高相等
};

@interface YFCollectionViewAutoFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,weak)id <YFCollectionViewAutoFlowLayoutDelegate>delegate;

/**
 *  每个item的间隔
 */
@property (nonatomic, assign)CGFloat interSpace;

// 默认 ItemSizeEqualHeight,所有item等高
@property(nonatomic,assign)ItemSizeType itemSizeType;


/***** 仅在 scrollDirection 为 UICollectionViewScrollDirectionHorizontal 有效 *****/
// itemSize相等

// 是否启动分页功能,默认为NO
@property(nonatomic,assign)BOOL pageEnable;
// 一行显示的items个数,在pageEnable为YES的时候起效
@property(nonatomic,assign)NSInteger numberOfItemsInLine;
// 每一页显示几行,默认为 2
@property(nonatomic,assign)NSInteger numberOfLines;

@end
