//
//  PFCollectionViewFlowLayout.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit


/// 添加按钮点击代理方法
//protocol LBFMRecommendHeaderCellDelegate:NSObjectProtocol {
//    func recommendHeaderBtnClick(categoryId:String,title:String,url:String)
//    func recommendHeaderBannerClick(url:String)
//}


protocol PFCollectionViewFlowLayoutDelegate: NSObjectProtocol {
    
    func obtainItemWidth(layout:PFCollectionViewFlowLayout, atIndexPath: IndexPath)
}


class PFCollectionViewFlowLayout: UICollectionViewFlowLayout {
	
    /** 代理 */
    weak var delegate : PFCollectionViewFlowLayoutDelegate?
    /** 保存cell的frame的x值 */
    var xFrameArray = NSMutableArray()
    /** 保存cell的frame的x值 */
    var yFrameArray = NSMutableArray()
    
    
    private var layout : UICollectionViewFlowLayout = {
       
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.itemSize = CGSize(width: 100, height: 40)
        
        return layout
    }()
    
    override init() {
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PFCollectionViewFlowLayout {
    
    
    /*
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
     
     */
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let array = super.layoutAttributesForElements(in: rect)
        
        var itemArray = Array(repeating: "", count: array!.count)
        
        for attrs in array! {
            
            let att : UICollectionViewLayoutAttributes = layoutAttributesForItem(at: attrs.indexPath)!
            itemArray.append(att)
            
        }
        
        return array
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        //collectionView 距离父视图左边的距离
        var x  = self.sectionInset.left
        //collectionView 距离父视图顶部的距离
        var y  = self.sectionInset.top
        //判断获得前一个cell的row
        let preRow = indexPath.row - 1
        
        if preRow >= 0 {
            
            if self.yFrameArray.count > preRow {
                x = self.xFrameArray[preRow] as! CGFloat
                y = self.yFrameArray[preRow] as! CGFloat
            }
        //？？？
        let preIndexPath = IndexPath.init()
            
        let prewidth = self.delegate?.obtainItemWidth(layout: self, atIndexPath: preIndexPath) as! CGFloat
            
        x += prewidth + self.minimumLineSpacing
    }
        
    //获取cell的宽度
    var currentWidth = self.delegate?.obtainItemWidth(layout: self, atIndexPath: indexPath)
    //保证一个cell不超过最大宽度
    // currentWidth = min(currentWidth, self.collectionView.frame.size.width! - self.sectionInset.left - self.sectionInset.right)
        
        
        return nil
        
    }
    
}




