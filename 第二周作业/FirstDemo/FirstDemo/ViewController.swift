//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/10/23.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    /// 列表
    @IBOutlet weak var tab_contacts: UITableView!
    
    var ary_data: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ary_data = NSMutableArray.init()
        self.ary_data.add(ContactModel.init(image: UIImage.init(named: "1.jpg"), name: "鸭嘴兽"))
        self.ary_data.add(ContactModel.init(image: UIImage.init(named: "2.jpg"), name: "紫陆寄居蟹"))
        self.ary_data.add(ContactModel.init(image: UIImage.init(named: "3.jpg"), name: "草莓箭毒蛙"))
        self.ary_data.add(ContactModel.init(image: UIImage.init(named: "4.jpg"), name: "菲律宾眼镜猴"))
        self.ary_data.add(ContactModel.init(image: UIImage.init(named: "5.jpg"), name: "萨克森风鸟"))
        self.ary_data.add(ContactModel.init(image: UIImage.init(named: "6.jpg"), name: "龙胆"))
        
        
        self.tab_contacts.register(UINib.init(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ary_data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell:ContactsCell = tableView .dequeueReusableCell(withIdentifier: "ContactsCell") as! ContactsCell
        let model = self.ary_data[indexPath.row] as! ContactModel
        cell.img_icon.image = model.image
        cell.lab_name.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.ary_data[indexPath.row] as! ContactModel
        self.performSegue(withIdentifier: "ToDetailViewController", sender: model)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailViewController" {
            let detail = segue.destination as! DetailViewController
            detail.model = sender as! ContactModel
        }
    }
}

