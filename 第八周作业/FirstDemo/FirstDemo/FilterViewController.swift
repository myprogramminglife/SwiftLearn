//
//  FilterViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/12/5.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var sql:SQLiteManager!
    var conditions:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sql = SQLiteManager.init()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 4
        }else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "PRICE"
        }else if section == 1{
            return "MOST POPULAR"
        }else{
            return "SORT BY"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "FMDBCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellId)
        }
        
        if indexPath.row == 0&&indexPath.section == 0 {
            cell?.textLabel?.text = "$"
            cell?.detailTextLabel?.text = "\(sql.queryTeaData(sql:"SELECT * FROM Tea where price='$'").count) bubble tea places"
        }else if indexPath.row == 1&&indexPath.section == 0 {
            cell?.textLabel?.text = "$$"
            cell?.detailTextLabel?.text = "\(sql.queryTeaData(sql:"SELECT * FROM Tea where price='$$'").count) bubble tea places"
        }else if indexPath.row == 2&&indexPath.section == 0 {
            cell?.textLabel?.text = "$$$"
            cell?.detailTextLabel?.text = "\(sql.queryTeaData(sql:"SELECT * FROM Tea where price='$$$'").count) bubble tea places"
        }else if indexPath.row == 0&&indexPath.section == 1 {
            cell?.textLabel?.text = "Offering a deal"
        }else if indexPath.row == 1&&indexPath.section == 1 {
            cell?.textLabel?.text = "Within walking distance"
            cell?.detailTextLabel?.text = "<500m"
        }else if indexPath.row == 2&&indexPath.section == 1 {
            cell?.textLabel?.text = "Has User Tips"
        }else if indexPath.row == 0&&indexPath.section == 2 {
            cell?.textLabel?.text = "Name(A-Z)"
        }else if indexPath.row == 1&&indexPath.section == 2 {
            cell?.textLabel?.text = "Name(Z-A)"
        }else if indexPath.row == 2&&indexPath.section == 2 {
            cell?.textLabel?.text = "Distance"
        }else{
            cell?.textLabel?.text = "Price"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let oldIndex = tableView.indexPathForSelectedRow {
            tableView.cellForRow(at: oldIndex)?.accessoryType = UITableViewCellAccessoryType.none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        
        if indexPath.row == 0&&indexPath.section == 0 {
            self.conditions = "SELECT * FROM Tea where price='$'"
        }else if indexPath.row == 1&&indexPath.section == 0 {
            self.conditions = "SELECT * FROM Tea where price='$$'"
        }else if indexPath.row == 2&&indexPath.section == 0 {
            self.conditions = "SELECT * FROM Tea where price='$$$'"
        }else if indexPath.row == 1&&indexPath.section == 1 {
            self.conditions = "SELECT * FROM Tea where distance < 500"
        }else if (indexPath.row == 2&&indexPath.section == 1) || (indexPath.row == 0&&indexPath.section == 1) {
            self.conditions = "SELECT * FROM Tea order by tier asc;"
        }else if indexPath.row == 0&&indexPath.section == 2 {
            self.conditions = "SELECT * FROM Tea order by name asc;"
        }else if indexPath.row == 1&&indexPath.section == 2 {
            self.conditions = "SELECT * FROM Tea order by name desc;"
        }else if indexPath.row == 2&&indexPath.section == 2 {
            self.conditions = "SELECT * FROM Tea order by distance asc;"
        }else{
            self.conditions = "SELECT * FROM Tea order by price asc;"
        }
        
        return indexPath
    }
   

    @IBAction func pop(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Filter"), object: self.conditions)
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
