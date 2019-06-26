//
//  PFCollectionViewCell.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit

//---


class PFCollectionViewCell: UICollectionViewCell {
	
	private lazy var label : UILabel = {
		
		let label = UILabel()
		label.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50)
		label.text = "飞龙在天"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textAlignment = .center
		
		return label
		
	}()
    
}
