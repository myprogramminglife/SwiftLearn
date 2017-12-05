//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/12/4.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var dataAry:NSMutableArray!
    var sql:SQLiteManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sql = SQLiteManager.init()
        
        self.dataAry = sql.queryTeaData(sql:"SELECT * FROM Tea")
        
        NotificationCenter.default.addObserver(self, selector: #selector(filterNotification(_:)), name: NSNotification.Name(rawValue: "Filter"), object: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "FMDBCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        let dic = self.dataAry[indexPath.row] as! NSDictionary
        cell?.textLabel?.text = dic["name"]! as? String
       
        print(dic)
        return cell!
    }


    @objc func filterNotification(_ notification:Notification){
        
        guard notification.object != nil else {
            return
        }
        let conditions = notification.object as! String
        if conditions == "$" {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea where price='$'")
        }else if conditions == "$$" {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea where price='$$'")
        }else if conditions == "$$$" {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea where price='$$$'")
        }else if conditions == "Name(A-Z)" {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea order by name asc;")
        }else if conditions == "Distance"{
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea order by distance asc;")
        }else if conditions == "Price" {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea order by price asc;")
        }else if conditions == "Name(Z-A)"  {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea order by name desc;")
        }else if conditions == "Within walking distance"  {
            self.dataAry = self.sql.queryTeaData(sql:"SELECT * FROM Tea where distance < 500")
        }
        self.table.reloadData()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

