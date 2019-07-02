//
//  PFCollectionViewFlowLayout.m
//  PF_Custome_CollectionView
//
//  Created by 天下林子 on 2019/6/21.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

#import "PFCollectionViewFlowLayout.h"


@interface PFCollectionViewFlowLayout ()

@property(nonatomic,assign)CGFloat rowHeight;///< 固定行高

/** 保存cell的frame的x值 */
@property (nonatomic, strong) NSMutableArray  *xFrameArray;

/** 保存cell的frame的x值 */
@property (nonatomic, strong) NSMutableArray  *yFrameArray;

@property (nonatomic, strong) NSMutableArray  *cellArray;

@end


@implementation PFCollectionViewFlowLayout

- (instancetype)initWithRowHeight:(CGFloat)rowHeight
{
    self = [super init];
    if (self) {
        self.rowHeight = rowHeight;
		self.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
		
        //列间距
        self.minimumInteritemSpacing = 15;
        //行间距
        self.minimumLineSpacing = 15;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.itemSize = CGSizeMake(90, [UIScreen mainScreen].bounds.size.height-64);

        self.xFrameArray = [NSMutableArray array];
        self.yFrameArray = [NSMutableArray array];
        
    }
    return self;
}

#pragma mark -  布局item
#pragma mark -----处理所有item的layoutAttribute-----------
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];

    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:array.count];

    for (UICollectionViewLayoutAttributes *attrs in array) {
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:attrs.indexPath];
        [itemArray addObject:attr];
    }

    return itemArray;
}


#pragma mark - 处理单个的Item的layoutAttributes
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
	//collectionView 距离父视图左边的距离
    CGFloat x = self.sectionInset.left;
	
	//collectionView 距离父视图顶部的距离
    CGFloat y = self.sectionInset.top;
    
    //判断获得前一个cell的row
    NSInteger preRow = indexPath.row - 1;
    
    if(preRow >= 0)
	{
        if(self.yFrameArray.count > preRow)
		{
            x = [self.xFrameArray[preRow] floatValue];
            y = [self.yFrameArray[preRow] floatValue];
        }
        
        NSIndexPath *preIndexPath = [NSIndexPath indexPathForItem:preRow inSection:indexPath.section];
        CGFloat preWidth = [self.delegate obtainItemWidth:self widthAtIndexPath:preIndexPath];
		
        x += preWidth + self.minimumInteritemSpacing;
    }
	
	//获取cell的宽度
    CGFloat currentWidth = [self.delegate obtainItemWidth:self widthAtIndexPath:indexPath];;
    
    //保证一个cell不超过最大宽度
    currentWidth = MIN(currentWidth, self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right);
	
	//根据cell的宽度+间距 计算cell的x和y坐标，如果大于一行则换行，否则不换行
    if(x + currentWidth > self.collectionView.frame.size.width - self.sectionInset.right)
	{
        //超出范围，换行 计算x值， y值
        x = self.sectionInset.left;
        y += _rowHeight + self.minimumLineSpacing;
    }
	
    // 创建属性设置cell的frame
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, currentWidth, _rowHeight);
	
	/*
	 按照row将cell的frame的x和y插入进去
	 也可以使用insertObject:方法
	 */
    self.xFrameArray[indexPath.row] = @(x);
    self.yFrameArray[indexPath.row] = @(y);
	
	//NSLog(@"___xFrameArray___%@________yFrameArray___%@", self.xFrameArray, self.yFrameArray);
	
    return attrs;
}



@end
