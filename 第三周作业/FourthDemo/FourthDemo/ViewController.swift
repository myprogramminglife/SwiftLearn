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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.type.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "TypeCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        let dic = self.type[indexPath.row] as! NSDictionary
        cell?.textLabel?.text = dic.allKeys[0] as? String
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        let dic = self.type[indexPath.row] as! NSDictionary

        self.detail = dic[cell.textLabel?.text as Any] as! NSArray
        self.collecitonView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.detail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collecitonView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCell
        cell.title.text = self.detail.object(at: indexPath.row) as? String
        return cell
    }
    
}

