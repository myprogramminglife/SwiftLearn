//
//  ContactModel.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/10/23.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ContactModel: NSObject {
    var image: UIImage!
    var name : String!
    
    init(image:UIImage!,name:String!) {
        super.init()
        self.image = image
        self.name = name
        
    }
}
