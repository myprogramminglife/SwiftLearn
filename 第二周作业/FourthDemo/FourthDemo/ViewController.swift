//
//  ViewController.swift
//  FourthDemo
//
//  Created by 姜开棋 on 2017/10/26.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var array = NSMutableArray.init(array: ["1","1","1","1","1","1"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView.init()
        self.tableView.backgroundColor = UIColor(red:0.99, green:1.00, blue:0.93, alpha:1.00)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SwipeableCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.backgroundColor = UIColor(red:0.99, green:1.00, blue:0.93, alpha:1.00)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        cell?.textLabel?.text = "Joe Beez"
        cell?.imageView?.image = UIImage.init(named: "1.jpg")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: "😚\nDelete") { (action, index) in
            self.array.removeObject(at: index.row)
            self.tableView.reloadData()
        }
        delete.backgroundColor = UIColor.gray
        
        let share = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: "😘\nShare") { (action, index) in
           let share = UIActivityViewController.init(activityItems: ["分享","","www.baidu.com"], applicationActivities: nil)
            //不出现在活动项目
            share.excludedActivityTypes = [UIActivityType.print, UIActivityType.copyToPasteboard,UIActivityType.assignToContact,UIActivityType.saveToCameraRoll]
            self .present(share, animated: true, completion: nil)
            
        }
        share.backgroundColor = UIColor.orange
        
        let download = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: "☺️\nDownload") { (action, index) in
            let cell = self.tableView .cellForRow(at: index)
            let image = cell?.imageView?.image!
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
            
            let alert = UIAlertController.init(title: "提示", message: "下载成功", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default, handler: { (action) in
                
            })
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        download.backgroundColor = UIColor.brown
        return [download,share,delete]
    }
    
    

}

