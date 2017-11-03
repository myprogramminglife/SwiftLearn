//
//  TypeCell.swift
//  FourthDemo
//
//  Created by 姜开棋 on 2017/11/3.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class TypeCell: UICollectionViewCell {
    var imageView:UIImageView!
    var title:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red:0.49, green:0.07, blue:0.49, alpha:1.00)
        
        self.imageView = UIImageView.init(frame: CGRect(x: 5, y: 5, width: self.frame.size.width - 10, height: (self.frame.size.height - 25) * 0.7))
        self.imageView.image = UIImage.init(named: "bolong")
        self.addSubview(self.imageView)
        
        self.title = UILabel.init(frame: CGRect(x: 5, y: self.imageView.frame.size.height + self.imageView.frame.origin.y + 10, width: self.imageView.frame.size.width, height: (self.frame.size.height - 25) * 0.3))
        self.title.backgroundColor = UIColor(red:1.00, green:0.98, blue:0.30, alpha:1.00)
        self.title.textAlignment = NSTextAlignment.center
        self.title.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(self.title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
