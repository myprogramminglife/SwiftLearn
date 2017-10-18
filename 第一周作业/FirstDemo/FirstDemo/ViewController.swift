//
//  ViewController.swift
//  FirstDemo
//
//  Created by Apple on 2017/10/13.
//  Copyright © 2017年 Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 美元
    @IBOutlet weak var tf_dollar: UITextField!
    
    /// 比例
    @IBOutlet weak var lab_proportion: UILabel!
    
    /// 总数
    @IBOutlet weak var lab_total: UILabel!
    
    /// 比例条
    @IBOutlet weak var sd_progress: UISlider!
    
    var tipNumber:Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sd_progress.addTarget(self, action: #selector(changed(slider:)), for: UIControlEvents.valueChanged)
        self.lab_proportion.text = "Tip(%\(Int(self.sd_progress.value*100)))         $0.00"
        self.lab_total.text = "Total         $0.0"
    }
    
    
    /// 获得改变信息
    @objc func changed(slider:UISlider){
        if !self.tf_dollar.text!.isEmpty {
            tipNumber = Float(self.tf_dollar.text!)
            
            self.lab_proportion.text = String(format:"Tip(%%\(Int(slider.value*100)))         %.2f", tipNumber * slider.value)
            self.lab_total.text = String(format:"Total         %.2f", tipNumber * slider.value + tipNumber)
        }
        
       // self.lab_proportion.text = String(format:".2f",(Float(self.tf_dollar.text!)! * slider.value))
       // "Tip%\(Int(slider.value*100))   \(Float(self.tf_dollar.text!)! * slider.value)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

