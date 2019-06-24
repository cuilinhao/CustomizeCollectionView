//
//  PFCollectionViewFlowLayout.h
//  PF_Custome_CollectionView
//
//  Created by 天下林子 on 2019/6/21.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PFCollectionViewFlowLayout;

@protocol PFCollectionViewFlowLayoutDelegate <NSObject>

- (CGFloat)obtainItemWidth:(PFCollectionViewFlowLayout *)layout widthAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface PFCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<PFCollectionViewFlowLayoutDelegate >  delegate;


- (instancetype)initWithRowHeight:(CGFloat)rowHeight;

@end

NS_ASSUME_NONNULL_END
