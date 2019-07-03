//
//  PFCollectionView.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit

class PFCollectionView: UIView {
	
    let dataArray = ["天青色等烟雨","电子书城","全民朗读","大咖主播","活动","直播微课","听单"]
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.itemSize = CGSize(width: 100, height: 40)
        
        let coll = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100), collectionViewLayout: layout)
        coll.delegate = self
        coll.dataSource = self
        coll.backgroundColor = UIColor.white
        coll.register(PFCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return coll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PFCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		//return 12
        
        return self.dataArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PFCollectionViewCell
		
		//cell.label.text = "rrrrr"
        
        cell.label.text = self.dataArray[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            
            cell.backgroundColor = UIColor.orange
        }
        else
        {
            cell.backgroundColor = UIColor.red
        }
		return cell
	}
	
	// 每个分区的内边距
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		
		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
	
	// 最小 item 间距
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		
		return 15
	}
	
	// 最小行间距
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		
		return 15
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		//return CGSize.init(width: (LBFMScreenWidth - 30) / 3, height:(LBFMScreenWidth - 30) / 3)		
		return CGSize(width: 50, height: 50)
	}
}

extension PFCollectionView : PFCollectionViewFlowLayoutDelegate {
	
    func obtainItemWidth(layout:PFCollectionViewFlowLayout, atIndexPath: IndexPath) -> CGFloat {
        
        //获取cell上字体的宽度
        
        //var widthArr = [Any]()
        var widthArr:[CGFloat] = []
        for item in self.dataArray {
            
            //var text : NSString  = " "
            //text = text.appending(item) as NSString
            let text : NSString  = NSString(string: item)
            
            let maxSize = CGSize(width: UIScreen.main.bounds.size.width - 2 * 30, height: CGFloat(MAXFLOAT))
            
            let ww = NSString(string: text).boundingRect(with: maxSize, options: .usesFontLeading, attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)], context: nil).size.width
            
            widthArr.append(ww)
            
        }
        
        return widthArr[atIndexPath.row]
    }
}
