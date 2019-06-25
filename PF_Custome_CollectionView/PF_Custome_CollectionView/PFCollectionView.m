//
//  PFCollectionView.m
//  PF_Custome_CollectionView
//
//  Created by 天下林子 on 2019/6/21.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

#import "PFCollectionView.h"

#import "PFCollectionViewFlowLayout.h"
#import "PFCollectionViewCell.h"



#define kScreenW [UIScreen mainScreen].bounds.size.width


@interface PFCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource, PFCollectionViewFlowLayoutDelegate>

@property (nonatomic, strong) PFCollectionViewFlowLayout  *flowLayout;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UICollectionViewFlowLayout  *testFlow;

@end

@implementation PFCollectionView


#pragma mark - Lazy Load

- (PFCollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {

        _flowLayout = [[PFCollectionViewFlowLayout alloc] initWithRowHeight:50];
        _flowLayout.delegate = self;
    }
    
    return _flowLayout;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataArray = @[@"醉桃花",@"天青色等烟雨,而我在等你",@"而我在等你",@"窈窕淑女",@"君子好逑",@"第一式斩星辰"].mutableCopy;
        //    self.dataArray = @[@"这是一个",@"小普惠化",@"我要还款",@"宽带费",@"这是一个",@"小普惠化",@"我要还款",@"黑色手机宽带费"].mutableCopy;
        //  self.dataArray = @[@"小浦书友会",@"卡面随心随心换换"].mutableCopy;
        
        [self _initUI];
        
    }
    return self;
}


#pragma mark - initUI
- (void)_initUI
{
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 500) collectionViewLayout:self.flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self addSubview:collectionView];
    
    [collectionView registerClass:[PFCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    collectionView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.titleLb.text = self.dataArray[indexPath.row];
    
    
    
    if (indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        cell.backgroundColor = [UIColor purpleColor];
    }
    
    return cell;
}


//返回列间距
//MARK:--------返回列间距---------------
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//返回行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 25;
}
//返回距离边的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

//MARK:-设置宽和高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [NSString stringWithFormat:@"   %@   ",self.dataArray[indexPath.row]];
    
    CGSize textMaxSize = CGSizeMake(kScreenW - 2 * 30, MAXFLOAT);
    
    CGFloat ww =  [text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.width;
    
    return CGSizeMake(ww, 50);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - FlowLayout Delegate

- (CGFloat)obtainItemWidth:(PFCollectionViewFlowLayout *)layout widthAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [NSString stringWithFormat:@"   %@  ",self.dataArray[indexPath.row]];
    CGSize textMaxSize = CGSizeMake(kScreenW - 2 *30, MAXFLOAT);
    CGFloat ww = [text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.width;
    
    return ww;
}


@end
