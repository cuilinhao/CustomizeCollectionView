//
//  ViewController.swift
//  PF_Custome_CollectionViewCell
//
//  Created by 天下林子 on 2019/6/24.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
		
        _initUI()
    }


    func _initUI() {
        
        let searchResultView = PFCollectionView.init(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 200))
        self.view.addSubview(searchResultView)
        
        searchResultView.backgroundColor = UIColor.yellow
        
    }
}

