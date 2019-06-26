//
//  PFCollectionView.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit

class PFCollectionView: UIView {
	
	var collectionView = UICollectionView()

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(frame: CGRect) {
		
		super.init(frame: .zero)
		
		initUI()
		self.addSubview(collectionView)
	}
	
	
	func initUI() {
		
		   collectionView  = {
			
			let layout = UICollectionViewFlowLayout()
			layout.itemSize = CGSize(width: 90, height: 50)
			
			layout.minimumLineSpacing = 15
			layout.minimumInteritemSpacing = 15
			
			let collectionView = UICollectionView(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 200), collectionViewLayout: layout)
			
			collectionView.register(PFCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
			
			collectionView.delegate = self
			collectionView.dataSource = self
			
			return collectionView
		}()
	}
}


extension PFCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return 12
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PFCollectionViewCell
		
		cell.label.text = "rrrrr"
		
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
		
		
		
		
		
		
		return CGSize(width: 100, height: 50)
	}
}
