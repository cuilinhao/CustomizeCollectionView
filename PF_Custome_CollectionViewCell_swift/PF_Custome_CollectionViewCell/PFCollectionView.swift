//
//  PFCollectionView.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit

class PFCollectionView: UIView {

	private lazy var collectionView : UICollectionView = {

		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 90, height: 50)
		
		layout.minimumLineSpacing = 15
		layout.minimumInteritemSpacing = 15
		
		let collectionView = UICollectionView(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 200), collectionViewLayout: layout)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		return collectionView
	}()


}


extension PFCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
	}
	
}
