//
//  PFCollectionViewCell.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit


class PFCollectionViewCell: UICollectionViewCell {
	
	private lazy var lab : UILabel = {
		
		let lab = UILabel()
		lab.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50)
		lab.text = "rrrrr"
		
		lab.font = UIFont.systemFont(ofSize: 15)
		lab.textAlignment = .center
		
		return lab
	}()
}


extension PFCollectionViewCell {
	
	override func addSubview(_ view: UIView) {
		
		addSubview(lab)
	}
}
