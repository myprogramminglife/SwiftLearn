//
//  ViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/10/25.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var editTable: UIButton!
    @IBOutlet weak var addData: UIButton!
    @IBOutlet weak var tab_addressBook: UITableView!
    
    
    
    var ary_address:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ary_address = NSMutableArray.init()
        self.tab_addressBook.tableFooterView = UIView.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ary_address.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "AddressBookCell"
        var cell = tableView .dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellId)
        }
        let model = self.ary_address[indexPath.row] as! AddressBookModel
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.time
        cell?.imageView?.image = UIImage.init(named: model.icon)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tab_addressBook.deselectRow(at: indexPath, animated: true)
    }
    
    ///排序功能
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let model = self.ary_address[sourceIndexPath.row]
        self.ary_address.removeObject(at: sourceIndexPath.row)
        self.ary_address.insert(model, at: destinationIndexPath.row)
    }

    /// 删除功能
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.ary_address.removeObject(at: indexPath.row)
        }
        self.tab_addressBook.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    

    @IBAction func editTable(_ sender: UIButton) {
        if self.tab_addressBook.isEditing == true {
            self.tab_addressBook.isEditing = false
           sender.setTitle("Done", for: UIControlState.normal)
        }else{
            self.tab_addressBook.isEditing = true
            
            sender.setTitle("Edit", for: UIControlState.normal)
        }
        self.tab_addressBook.reloadData()
    }
    
    
    @IBAction func addData(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ToAddViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAddViewController"{
            let add = segue.destination as! AddViewController
            add.getAddressBook(block: { (model) in
                self.ary_address.add(model)
                self.tab_addressBook.reloadData()
            })
        }
    }
    
}

