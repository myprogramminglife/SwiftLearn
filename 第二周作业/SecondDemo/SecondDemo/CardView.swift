//
//  CardView.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/10/24.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var imageView:UIImageView!
    var textInfo:UILabel!
    var bottomView:UIView!
    
    var image:String!
    var text:String!

    init(frame: CGRect,image:String!,text:String!) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
        self.image = image
        self.text = text
        self.setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews(){
        self.imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.imageView.image = UIImage.init(named: self.image)
        self.addSubview(self.imageView)
        
        self.bottomView = UIView.init(frame: CGRect.init(x: 0, y: self.frame.size.height-40, width: self.frame.size.width, height: 40))
        self.bottomView.backgroundColor = UIColor.white
        self.bottomView.alpha = 0.8
        self.addSubview(self.bottomView)
        
        self.textInfo = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: self.bottomView.frame.size.width-20, height: self.bottomView.frame.size.height))
        self.textInfo.text = self.text
        self.textInfo.font = UIFont.systemFont(ofSize: 14)
        self.textInfo.textColor = UIColor.black
        self.bottomView.addSubview(self.textInfo)
    }
}
