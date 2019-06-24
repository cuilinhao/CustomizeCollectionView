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

@property (nonatomic, strong) NSMutableArray  *originxArray;
@property (nonatomic, strong) NSMutableArray  *originyArray;
@property (nonatomic, strong) NSMutableArray  *cellArray;

@end


@implementation PFCollectionViewFlowLayout

- (instancetype)initWithRowHeight:(CGFloat)rowHeight
{
    self = [super init];
    if (self) {
        self.rowHeight = rowHeight;
        self.sectionInset = UIEdgeInsetsZero;
        //列间距
        self.minimumInteritemSpacing = 15;
        //行间距
        self.minimumLineSpacing = 15;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.itemSize = CGSizeMake(60+30, [UIScreen mainScreen].bounds.size.height-64);
        
        self.originxArray = [NSMutableArray array];
        self.originyArray = [NSMutableArray array];
        
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
    self.minimumInteritemSpacing = 15;
    self.minimumLineSpacing = 15;//行间距
    
    //CGFloat x = self.sectionInset.left;
    //CGFloat y = self.sectionInset.top;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    //判断获得前一个cell的x和y
    NSInteger preRow = indexPath.row - 1;
    
    if(preRow >= 0){
        if(_originyArray.count > preRow){
            x = [_originxArray[preRow] floatValue];
            y = [_originyArray[preRow] floatValue];
        }
        NSIndexPath *preIndexPath = [NSIndexPath indexPathForItem:preRow inSection:indexPath.section];
        
        CGFloat preWidth = [self.delegate obtainItemWidth:self widthAtIndexPath:preIndexPath];
        x += preWidth + self.minimumInteritemSpacing;
    }
    
    CGFloat currentWidth = [self.delegate obtainItemWidth:self widthAtIndexPath:indexPath];;
    
    //保证一个cell不超过最大宽度
    currentWidth = MIN(currentWidth, self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right);
    
    if(x + currentWidth > self.collectionView.frame.size.width - self.sectionInset.right){
        //超出范围，换行
        x = self.sectionInset.left;
        y += _rowHeight + self.minimumLineSpacing;
    }
    
    // 创建属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, currentWidth, _rowHeight);
    _originxArray[indexPath.row] = @(x);
    _originyArray[indexPath.row] = @(y);
    
    return attrs;
}



@end
