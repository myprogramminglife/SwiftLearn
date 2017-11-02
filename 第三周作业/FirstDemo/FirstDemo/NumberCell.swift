//
//  NumberCell.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/1.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel.init(frame: self.bounds)
        label.backgroundColor = UIColor(red:0.61, green:0.45, blue:0.28, alpha:1.00)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = NSTextAlignment.center
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
