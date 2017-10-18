//
//  ViewController.swift
//  FourthDemo
//
//  Created by Apple on 2017/10/18.
//  Copyright © 2017年 Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tab_area: UITableView!
    var chauModel : ChauModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var data_area : NSMutableArray = NSMutableArray.init()
        
        let cityZ:NSArray = [AreaModel.init(type: "city", area: "北京"),
                            AreaModel.init(type: "city", area: "上海"),
                            AreaModel.init(type: "city", area: "深圳"),
                            AreaModel.init(type: "city", area: "广州")]
        data_area.add(StateModel.init(type: "state",name: "中国", area: cityZ,open: false))
        
        let cityM:NSArray = [AreaModel.init(type: "city", area: "莫斯科"),
                            AreaModel.init(type: "city", area: "新西伯利亚"),
                            AreaModel.init(type: "city", area: "叶卡捷琳堡")]
        data_area.add(StateModel.init(type: "state",name: "俄罗斯", area: cityM,open: false))
        
        self.chauModel = ChauModel.init(type: "chau", name: "亚洲", area: data_area, open: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number:Int = 1
        if self.chauModel.open == true {
            number += self.chauModel.area.count
        }
        for var state in self.chauModel.area{
            let state_gj:StateModel = state as! StateModel
            if state_gj.open == true {
                number += state_gj.area.count
            }            
        }
        
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellAry : NSMutableArray = NSMutableArray.init()
        if self.chauModel.open == true {
            for var state in self.chauModel.area{
                cellAry .add(state)
                let state_gj:StateModel = state as! StateModel
                if state_gj.open == true {
                    for var city in state_gj.area{
                        cellAry .add(city)
                    }
                }
            }
        }
        
        let cellId = "AreaCell"
        var tableCell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if tableCell == nil {
            tableCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        if indexPath.row == 0 {
            tableCell?.textLabel?.text = self.chauModel.name
        }else{
            let typeModel = cellAry[indexPath.row - 1]
            if typeModel is StateModel{
                let state :StateModel = typeModel as! StateModel
                tableCell?.textLabel?.text = state.name
            }else if typeModel is AreaModel{
                let city :AreaModel = typeModel as! AreaModel
                tableCell?.textLabel?.text = city.area
            }
        }
        tableCell?.backgroundColor = UIColor.gray
        tableCell?.selectionStyle = UITableViewCellSelectionStyle.none
        return tableCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if self.chauModel.open == false{
                self.chauModel.open = true
            }else{
                self.chauModel.open = false
            }
        }else if self.chauModel.open == true{
            var cellAry : NSMutableArray = NSMutableArray.init()
            for var state in self.chauModel.area{
                cellAry .add(state)
                let state_gj:StateModel = state as! StateModel
                if state_gj.open == true {
                    for var city in state_gj.area{
                        cellAry .add(city)
                    }
                }
            }
            let typeModel = cellAry[indexPath.row - 1]
            if typeModel is StateModel{
                let state :StateModel = typeModel as! StateModel
                if state.open == false{
                    state.open = true
                }else{
                    state.open = false
                }
            }
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

