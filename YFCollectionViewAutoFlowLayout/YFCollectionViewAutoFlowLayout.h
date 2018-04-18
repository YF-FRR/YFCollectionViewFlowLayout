//
//  YFCollectionViewAutoFlowLayout.h
//
//
//  Created by YangFei on 2018/4/3.
//  Copyright © 2018年 YangFei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ItemSizeType) {
    ItemSizeEqualAll= 0,        // 宽高相等, 横向滚动的时候具有分页效果
    ItemSizeEqualWidth,         // 等宽不等高
    ItemSizeEqualHeight ,       // 等高不等宽
};

@protocol YFCollectionViewAutoFlowLayoutDelegate <NSObject>

@required
/**
 *  每个item的尺寸
 *
 *  @param indexPath 所在的分组
 *
 *  @return item的尺寸
 */
-(CGSize)collectionView:(UICollectionView *)collectionView itemSizeForIndexPath:(NSIndexPath *)indexPath;

@optional
/**
 每个section的headerView的大小

 @param section 分区
 @return 返回section的headerView的大小
 */
-(CGSize)collectionView:(UICollectionView *)collectionView sectionHeadSizeForSection:(NSInteger)section;

@end

@interface YFCollectionViewAutoFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,weak)id <YFCollectionViewAutoFlowLayoutDelegate>delegate;

// 每个item的间隔
@property (nonatomic, assign)CGFloat interSpace;

// 默认 ItemSizeEqualAll,所有item等高等宽
@property(nonatomic,assign)ItemSizeType itemSizeType;

// 每一分区显示几行 >= 1
/*
 UICollectionViewScrollDirectionHorizontal 且 ItemSizeEqualAll   时,起效果
 */
@property(nonatomic,assign)int numberOfLines;

// 一行显示的items个数,
/*
1. UICollectionViewScrollDirectionHorizontal 且 ItemSizeEqualAll   时,起效果
2. UICollectionViewScrollDirectionVertical   且 ItemSizeEqualWidth 时,起效果
 */
@property(nonatomic,assign)int numberOfItemsInLine;

@end
