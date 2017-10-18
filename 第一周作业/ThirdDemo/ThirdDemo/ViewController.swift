//
//  ViewController.swift
//  ThirdDemo
//
//  Created by Apple on 2017/10/15.
//  Copyright © 2017年 Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. Shandong Hua xia High Tech. Information Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lay_topView: NSLayoutConstraint!
    
    @IBOutlet weak var lay_toTop: NSLayoutConstraint!
    
    @IBOutlet weak var lab_number: UILabel!
    
    @IBOutlet weak var btn_start: UIButton!
    
    var isStart: Bool = true
    
    var timer: DispatchSourceTimer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lay_topView.constant = UIScreen.main.bounds.height * 0.4
        
        if(UIScreen.main.bounds.size.width == 375.0&&UIScreen.main.bounds.size.height == 812.0){
            self.lay_toTop.constant = 24
        }else{
            self.lay_toTop.constant = 0
        }
    }

    
    /// 重置
    @IBAction func reset(_ sender: UIButton) {
        self.isStart = false
        self.lab_number.text = "0.0"
        self.timer.suspend()
    }
    

    ///开始
    @IBAction func start(_ sender: UIButton) {
        if self.timer == nil {
            ///创建定时器
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            timer.schedule(deadline: .now(), repeating: 0.5)
            timer.setEventHandler{
                if self.isStart == true{
                    var number:CGFloat = ViewController .StringToFloat(str: self.lab_number.text!)
                    number += 0.1
                    self.lab_number.text = String(format:"%.1f",number)
                }
            }
            self.timer.activate()
        }else{
            self.isStart = true
            self.timer.resume()
        }
    }
    
    ///暂停
    @IBAction func suspended(_ sender: UIButton) {
        guard self.timer == nil else {
            self.timer.suspend()
            return
        }
    }
    

    open class func StringToFloat(str:String)->(CGFloat){
        let string = str
        var cgFloat: CGFloat = 0
        
        if let doubleValue = Double(string)
        {
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
    }

}

