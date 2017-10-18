//
//  AreaModel.swift
//  FourthDemo
//
//  Created by Apple on 2017/10/18.
//  Copyright © 2017年 Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. All rights reserved.
//

import UIKit

class AreaModel: NSObject {
    var type : String!
    var area : String!
    
    init(type:String!,area:String!) {
        super.init()
        self.type = type
        self.area = area
    }
}

class StateModel: NSObject {
    var type : String!
    var area : NSArray!
    var name : String!
    var open : Bool!
    
    init(type:String!,name:String!,area:NSArray!,open:Bool!) {
        super.init()
        self.type = type
        self.area = area
        self.name = name
        self.open = open
    }
}

class ChauModel: NSObject {
    var type : String!
    var area : NSArray!
    var name : String!
    var open : Bool!
    
    init(type:String!,name:String!,area:NSArray!,open:Bool!) {
        super.init()
        self.type = type
        self.area = area
        self.name = name
        self.open = open
    }
}


