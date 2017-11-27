//
//  CollectionViewCell.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/11/27.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView.init(frame: self.bounds)
        self.imageView.backgroundColor = UIColor.yellow
        self.addSubview(self.imageView)
    }
    
    func getImage(imageUrl:String!){
        let queue = OperationQueue()
        queue.addOperation {
            let url = URL.init(string: imageUrl)
            let data = try! Data.init(contentsOf: url!)
            OperationQueue.main.addOperation({
                self.imageView.image = UIImage.init(data: data)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
