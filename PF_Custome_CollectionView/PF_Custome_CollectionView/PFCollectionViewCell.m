//
//  PFCollectionViewCell.m
//  PF_Custome_CollectionView
//
//  Created by 天下林子 on 2019/6/21.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

#import "PFCollectionViewCell.h"


@interface PFCollectionViewCell ()

@end


@implementation PFCollectionViewCell

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self addSubview:_titleLb];
        _titleLb.frame = CGRectMake(0, 0, self.bounds.size.width, 50);
        _titleLb.text = @"rrrrrr";
        
        
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLb;
    
}

@end
