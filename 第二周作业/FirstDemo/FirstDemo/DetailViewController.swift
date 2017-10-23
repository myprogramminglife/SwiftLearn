//
//  DetailViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/10/23.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var model:ContactModel! = nil
    
    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lab_name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.img_icon.image = model.image
        self.lab_name.text = model.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
