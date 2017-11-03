//
//  CardCell.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/11/3.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView.init(frame: self.bounds)
        self.imageView.layer.cornerRadius = 8
        self.imageView.layer.masksToBounds = true
        self.addSubview(self.imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
