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
    
}
