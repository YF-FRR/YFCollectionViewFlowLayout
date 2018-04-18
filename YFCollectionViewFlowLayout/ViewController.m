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
#import "KindCollectionViewCell.h"
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

static NSInteger seciotn_0 = -1;
static NSInteger seciotn_1 = -1;

@interface ViewController ()<YFCollectionViewAutoFlowLayoutDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *index_arr;
@property(nonatomic,weak)UICollectionView *kindCollectionView;
@property(nonatomic,strong)NSArray *kindArr;

@property(nonatomic,assign)ItemSizeType itemSizeType;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self changeFlowlayoutIndex];
    [self testCollectionFlowLayout];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)changeFlowlayoutIndex{
    self.kindArr = @[
  @[@"ScrollHorizontal",@"ScrollVertical"],
  @[@"SizeEqualAll",@"SizeEqualWidth",@"SizeEqualHeight"]];
    
    YFCollectionViewAutoFlowLayout * flowLayout=[[YFCollectionViewAutoFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.interSpace = 10;
    flowLayout.numberOfItemsInLine = 3;
    flowLayout.numberOfLines = 1;
    flowLayout.itemSizeType = ItemSizeEqualHeight;
    flowLayout.delegate = self;
    
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    collectionView.backgroundColor = [UIColor yellowColor];
    [collectionView registerClass:[KindCollectionViewCell class] forCellWithReuseIdentifier:@"KindCollectionViewCell"];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    self.kindCollectionView = collectionView;
    [self.kindCollectionView addLayoutConstraint:UIEdgeInsetsMake(34, 0, -(HEIGHT - 120), 0)];
    
}

#pragma mark ====== 测试 YFCollectionViewAutoFlowLayout =======
-(void)testCollectionFlowLayout{
    self.index_arr = @[@"第一个Item",@"第二个Item",@"第三个Item",@"第四个Item",@"第五个Item",@"第六个Item",@"第七个Item",@"第八个Item",@"第九个Item",@"第十个Item",@"第一个Item",@"第二个Item",@"第三个Item",@"第四个Item",@"第五个Item",@"第六个Item",@"第七个Item",@"第八个Item",@"第九个Item",@"第十个Item"];
    
    YFCollectionViewAutoFlowLayout * flowLayout=[[YFCollectionViewAutoFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(1, 1);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.interSpace = 10;
    flowLayout.numberOfItemsInLine = 4;
    flowLayout.numberOfLines = 3;
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
    [self.collectionView addLayoutConstraint:UIEdgeInsetsMake(140, 0, -100, 0)];

}

#pragma mark ====== YFCollectionViewAutoFlowLayoutDelegate =======

-(CGSize)collectionView:(UICollectionView *)collecitonView itemSizeForIndexPath:(NSIndexPath *)indexPath{
    
    if (collecitonView == self.kindCollectionView) {
        return indexPath.section == 0 ? CGSizeMake((WIDTH - 30)/2, 25) : CGSizeMake((WIDTH -40)/3, 25);
    }

    switch (self.itemSizeType) {
        case ItemSizeEqualAll:
             return CGSizeMake((WIDTH - 50)/4, (WIDTH - 50)/4);// 等高等宽
            break;
            
        case ItemSizeEqualWidth:
            if ([(YFCollectionViewAutoFlowLayout *)collecitonView.collectionViewLayout scrollDirection] == UICollectionViewScrollDirectionVertical) {
               return CGSizeMake(60 + indexPath.section * 20, 300 / (arc4random() % 5 + 1));// 等宽不等高
            }else{
               return CGSizeMake(60 + indexPath.section * 20, 300 / (indexPath.row + 4 - indexPath.section));// 等宽不等高; 横向滚动
            }
            break;
            
        case ItemSizeEqualHeight:
             return CGSizeMake(300 / (arc4random() % 5 + 1), 40 + indexPath.section * 20); // 等高不等宽
            break;
            
        default:
             return CGSizeMake((WIDTH - 50)/4, (WIDTH - 50)/4);// 等高等宽
            break;
    }

}

-(CGSize)collectionView:(UICollectionView *)collectionView sectionHeadSizeForSection:(NSInteger)section{
    return collectionView == self.kindCollectionView ? CGSizeZero : CGSizeMake(WIDTH, 30);
}

#pragma mark ====== UICollectionViewDataSource =======
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return collectionView == self.kindCollectionView ? [self.kindArr[section] count] : self.index_arr.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.kindCollectionView) {
        KindCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KindCollectionViewCell" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [cell realoadCellWith:self.kindArr[indexPath.section][indexPath.item] selected:(indexPath.row == seciotn_0) ];
        }else{
            [cell realoadCellWith:self.kindArr[indexPath.section][indexPath.item] selected:(indexPath.row == seciotn_1)];
        }

        return cell;
    }else{
        IndexIndicatorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IndexIndicatorCell" forIndexPath:indexPath];
        [cell realoadCellWith:self.index_arr[indexPath.item] count:@""];
        cell.backgroundColor = RandomColor;
        return cell;
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.kindCollectionView) {
        return nil;
    }
    HeaderReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView" forIndexPath:indexPath];
    header.titleStr = [NSString stringWithFormat:@"第%ld个区头",indexPath.section];
    header.backgroundColor = RandomColor;
    return header;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        seciotn_0 = indexPath.item;
    }else{
        seciotn_1 = indexPath.item;
    }
    if (seciotn_0 >= 0 && seciotn_1 >= 0) {
        YFCollectionViewAutoFlowLayout * flowLayout=[[YFCollectionViewAutoFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.interSpace = 10;
        flowLayout.numberOfItemsInLine = 4;
        flowLayout.numberOfLines = 3;
        flowLayout.delegate = self;
        
        flowLayout.scrollDirection = seciotn_0 == 0 ? UICollectionViewScrollDirectionHorizontal : UICollectionViewScrollDirectionVertical;
   
        switch (seciotn_1) {
            case 0:
                flowLayout.itemSizeType = 0;
                break;
            case 1:
                flowLayout.itemSizeType = 1;
                break;
            case 2:
                flowLayout.itemSizeType = 2;
                break;
            default:
                flowLayout.itemSizeType = 0;
                break;
        }
    
        self.itemSizeType = flowLayout.itemSizeType;
        self.collectionView.collectionViewLayout = flowLayout;
    }
    [self.kindCollectionView reloadData];
}

@end
