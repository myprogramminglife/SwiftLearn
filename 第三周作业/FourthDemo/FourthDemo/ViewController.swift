//
//  ViewController.swift
//  FourthDemo
//
//  Created by 姜开棋 on 2017/11/3.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    

    @IBOutlet weak var collecitonView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    let lobster:[String:NSArray] = ["龙虾":["加拿大龙虾","美国龙虾","爱尔兰龙虾","南澳龙","南非油龙"]]
    let crab:[String:NSArray] = ["蟹类":["河蟹","石蟹","花蟹","梭子蟹","青蟹","面包蟹","红蟹"]]
    let shellfish:[String:NSArray] = ["贝类":["牡蛎","贻贝","扇贝","蛤"]]
    var type:NSMutableArray!
    var detail:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.type = NSMutableArray.init()
        self.type .add(lobster)
        self.type .add(crab)
        self.type .add(shellfish)
        ///collecitonView
        let itemW = (UIScreen.main.bounds.size.width * 0.7 - 10) * 0.5
        self.collecitonView.register(TypeCell.self, forCellWithReuseIdentifier: "TypeCell")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: itemW,height: itemW *  1.5)
        self.collecitonView.collectionViewLayout = layout
        self.collecitonView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5)
        ///默认选中第一个
        let dic = self.type[0] as! NSDictionary
        self.detail = dic["龙虾"] as! NSArray
        let index:IndexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at:index, animated: true, scrollPosition: UITableViewScrollPosition.none)
    }

    
    
    
}

