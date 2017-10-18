//
//  ViewController.swift
//  SecondDemo
//
//  Created by Apple on 2017/10/14.
//  Copyright © 2017年 Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let tab_name: UITableView = {
        let y: CGFloat
        if(UIScreen.main.bounds.size.width == 375.0&&UIScreen.main.bounds.size.height == 812.0){
            y = 88
        }else{
            y = 64
        }
        
        let table = UITableView.init(frame:
            CGRect(x: 0, y: y, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - y), style: UITableViewStyle.grouped)
        return table
    }()
    
    var ary_info = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ary_info = [["name":"A","value":["Ave"]],
                        ["name":"B","value":["Bob","Bond","Beck","Biss"]],
                        ["name":"C","value":["Chris","Clark"]],
                        ["name":"D","value":["Davina","Delica","Diane","Doris"]],
                        ["name":"E","value":["Ela","Edision","Elise","Ena"]],
                        ["name":"J","value":["Jugg"]]]
        self.tab_name.delegate = self as UITableViewDelegate
        self.tab_name.dataSource = self as UITableViewDataSource
        self.tab_name.backgroundColor = UIColor.white
        self.view .addSubview(self.tab_name)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.ary_info.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var dic:Dictionary<String,Any> = self.ary_info[section] as! Dictionary
        let ary:Array<String> = dic["value"] as! Array
        
        return ary.count
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var array = Array<String>()
        
        for  dic in self.ary_info{
            let dicc:Dictionary<String,Any> = dic as! Dictionary
            array.append(dicc["name"] as! String)
        }
        return array
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect(x: 30, y: 0, width: 100, height: 30))        
        var dic:Dictionary<String,Any> = self.ary_info[section] as! Dictionary
        label.text = dic["name"] as? String
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "NameCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        
        var dic:Dictionary<String,Any> = self.ary_info[indexPath.section] as! Dictionary
        let ary:Array<String> = dic["value"] as! Array
        cell?.textLabel?.text = ary[indexPath.row]
        return cell!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

