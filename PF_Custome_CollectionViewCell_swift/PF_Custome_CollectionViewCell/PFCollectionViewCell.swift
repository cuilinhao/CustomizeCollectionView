//
//  PFCollectionViewCell.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit


class PFCollectionViewCell: UICollectionViewCell {
	
	var label  = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func initUI() {
		
		self.addSubview(label)
		label.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50)
		label.text = "飞龙在天"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textAlignment = .center
	}
	
}
