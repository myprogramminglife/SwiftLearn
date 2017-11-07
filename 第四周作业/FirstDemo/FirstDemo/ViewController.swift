//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/6.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

let screenW = UIScreen.main.bounds.size.width
let screenH = UIScreen.main.bounds.size.height


class ViewController: UIViewController {

    var layer:CALayer!
    ///时
    let hourView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.black
        view.bounds = CGRect(x: 0, y: 0, width: 3, height: 50)
        view.center = CGPoint(x: screenW * 0.5, y: screenH * 0.5)
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        return view
    }()
    ///分
    let minutesView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.black
        view.bounds = CGRect(x: 0, y: 0, width: 3, height: 60)
        view.center = CGPoint(x: screenW * 0.5, y: screenH * 0.5)
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        return view
    }()
    ///秒
    let secondView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.red
        view.bounds = CGRect(x: 0, y: 0, width: 1, height: 60)
        view.center = CGPoint(x: screenW * 0.5, y: screenH * 0.5)
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///创建Layer
        self.layer = CALayer.init()
        self.layer.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        self.layer.position = CGPoint(x: screenW * 0.5, y: screenH * 0.5)
        self.layer.contents = UIImage.init(named: "clock")?.cgImage
        self.view.layer.addSublayer(self.layer)
        
        self.view.addSubview(self.hourView)
        self.view.addSubview(self.minutesView)
        self.view.addSubview(self.secondView)
        
        ///定时器
        let link = CADisplayLink.init(target: self, selector: #selector(ViewController.running))
        link .add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }

    
    
    @objc func running(){
        //获取本地时区
        let zone = NSTimeZone.local
        //获取日历
        var calendar = NSCalendar.current
        calendar.timeZone = zone
        
        let currentTime = calendar.dateComponents([Calendar.Component.hour , Calendar.Component.minute , Calendar.Component.second , Calendar.Component.timeZone], from: Date())
        
        let secondAngle = (Double.pi * 2 / 60) * Double(currentTime.second!)
        self.secondView.transform = CGAffineTransform(rotationAngle: CGFloat(secondAngle))
        
        let minuteAngle = (Double.pi * 2 / 60) * Double(currentTime.minute!)
        self.minutesView.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle))
        
        let hourAngle = (Double.pi * 2 / 12) * Double(currentTime.hour!)
        self.hourView.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

