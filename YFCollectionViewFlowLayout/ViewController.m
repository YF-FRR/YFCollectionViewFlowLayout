//
//  ViewController.m
//  YFPageViewControllerVC
//
//  Created by ios_yangfei on 2017/12/16.
//  Copyright © 2017年 jianghu3. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Extension.h"
#import "IndexIndicatorCell.h"
#import "YFCollectionViewAutoFlowLayout.h"
#import "HeaderReusableView.h"



#define indicatorViewH 40

#define RandomColor [UIColor colorWithRed:(arc4random()%256 /255.0) green:(arc4random()%256 /255.0) blue:(arc4random()%256/255.0) alpha:1.0]

#define isIPhoneX ([UIScreen mainScreen].bounds.size.width>= 375.0f && [UIScreen mainScreen].bounds.size.height >= 812.0f)
//状态栏高度
#define STATUS_HEIGHT (isIPhoneX ? 44 : 20)
//导航栏高
#define NAVI_HEIGHT (44 + STATUS_HEIGHT)

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT (isIPhoneX ? ([UIScreen mainScreen].bounds.size.height -13 ) :[UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<YFCollectionViewAutoFlowLayoutDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *index_arr;
@property(nonatomic,strong)NSMutableArray *subVCArr;

@property(nonatomic,weak)UIScrollView *contentScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self testCollectionFlowLayout];
}

#pragma mark ====== 测试 YFCollectionViewAutoFlowLayout =======
-(void)testCollectionFlowLayout{
    self.index_arr = @[@"第一个Item",@"第二个Item",@"第三个Item",@"第四个Item",@"第五个Item",@"第六个Item",@"第七个Item",@"第八个Item",@"第九个Item",@"第十个Item"];
    
    YFCollectionViewAutoFlowLayout * flowLayout=[[YFCollectionViewAutoFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(1, 1);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.interSpace = 10;
    flowLayout.numberOfItemsInLine = 3;
    flowLayout.numberOfLines = 2;
    flowLayout.itemSizeType = ItemSizeEqualAll;
    flowLayout.delegate = self;
    
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    collectionView.backgroundColor = [UIColor yellowColor];
    [collectionView registerClass:[IndexIndicatorCell class] forCellWithReuseIdentifier:@"IndexIndicatorCell"];
    [collectionView registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView"];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView addLayoutConstraint:UIEdgeInsetsMake(100, 0, -100, 0)];

}

#pragma mark ====== YFCollectionViewAutoFlowLayoutDelegate =======
-(CGSize)collectionViewItemSizeForIndexPath:(NSIndexPath *)indexPath{
//    CGFloat width = self.collectionView.frame.size.width / self.index_arr.count;
    
    
//    return CGSizeMake(300 / (arc4random() % 5 + 1), 40 + indexPath.section * 20); // 等高不等宽
//    return CGSizeMake(60 + indexPath.section * 20, 300 / (arc4random() % 5 + 1));// 等宽不等高
//    return CGSizeMake(60 + indexPath.section * 20, 300 / (indexPath.row + 4 - indexPath.section));// 等宽不等高; 横向滚动
    return CGSizeMake(90, 90);// 等高等宽
    
}

-(CGSize)collectionViewSectionHeadSizeForSection:(NSInteger)section{
    return CGSizeMake(WIDTH, 30);
}

#pragma mark ====== UICollectionViewDataSource =======
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.index_arr.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexIndicatorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IndexIndicatorCell" forIndexPath:indexPath];
    [cell realoadCellWith:self.index_arr[indexPath.item] count:@""];
    cell.backgroundColor = RandomColor;
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HeaderReusableView *header = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView" forIndexPath:indexPath];
    header.titleStr = [NSString stringWithFormat:@"第%ld个区头",indexPath.section];
    header.backgroundColor = RandomColor;
    return header;
}

@end
