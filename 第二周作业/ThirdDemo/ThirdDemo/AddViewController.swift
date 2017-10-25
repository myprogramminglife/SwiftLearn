//
//  AddViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/10/25.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {
    typealias addBlock = (AddressBookModel) -> ()
    var block: addBlock?
    
    var model:AddressBookModel!
    
    @IBOutlet weak var v_chooseType: UIView!
    
    @IBOutlet weak var tf_title: UITextField!
    
    @IBOutlet weak var picker_date: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.tf_title.delegate = self
        self.model = AddressBookModel.init()
        self.model.icon = "people_selected"
        self.model.title = ""
        self.picker_date.addTarget(self, action: #selector(chooseDate( _:)), for: UIControlEvents.valueChanged)
        self.getTime()
    }
    
    
    
    //时间选择器
    @objc func chooseDate(_ datePicker:UIDatePicker){
        let choosedate = datePicker.date
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "YYYY-MM-dd"
        self.model.time = dateFormater.string(from: choosedate)
    }
    
    func getTime(){
        let choosedate = Date()
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "YYYY-MM-dd"
        self.model.time = dateFormater.string(from: choosedate)
    }
    
//    TextField
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.model.title = textField.text
    }
    
    /// 闭包
    func getAddressBook(block:addBlock?){
        self.block = block
    }
    
    /// 添加
    @IBAction func add(_ sender: UIButton) {
        self.tf_title .resignFirstResponder()
        if let block = self.block {
            block(model)
            self.navigationController?.popViewController(animated: true)
        }
    }

    /// 类型选择
    @IBAction func chooseType(_ sender: UIButton){
        self.tf_title .resignFirstResponder()
        for var view in self.v_chooseType.subviews{
            if view is UIButton{
                let button = view as! UIButton
                button.isSelected = false
            }
        }
        sender.isSelected = true
        switch sender.tag {
        case 100:
            self.model.icon = "people_selected"
            break
        case 101:
            self.model.icon = "iphone_selected"
            break
        case 102:
            self.model.icon = "shopping_selected"
            break
        case 103:
            self.model.icon = "plane_selected"
            break
        default:
            break
        }
    }
}
