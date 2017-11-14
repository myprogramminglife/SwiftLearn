//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/10.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var percent: UILabel!
    
    @IBOutlet weak var numberView: UIView!
    
    @IBOutlet weak var tf_number: UITextField!
    
    
    var shapeLayer:CAShapeLayer!
    
    var bgShapeLayer:CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///路径
        let bgPath = UIBezierPath.init(arcCenter: CGPoint(x: self.numberView.center.x * 0.53, y: self.numberView.center.x * 0.53), radius: 100, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        
        ///背景
        self.shapeLayer = CAShapeLayer.init()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.frame = self.numberView.bounds
        shapeLayer.position = CGPoint(x: self.numberView.center.x * 0.53, y: self.numberView.center.x * 0.53)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor(red:0.30, green:0.62, blue:0.91, alpha:1.00).cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        self.numberView.layer .addSublayer(self.shapeLayer)
        
        
        ///路径
        let path = UIBezierPath.init(arcCenter: CGPoint(x: self.numberView.center.x * 0.53, y: self.numberView.center.x * 0.53), radius: 100, startAngle: CGFloat(-(Double.pi * 2 * 0.25)) , endAngle: CGFloat(Double.pi * 2 * 0.75), clockwise: true)
        
        ///CAShapeLayer
        self.shapeLayer = CAShapeLayer.init()
        shapeLayer.path = path.cgPath
        shapeLayer.frame = self.numberView.bounds
        shapeLayer.position = CGPoint(x: self.numberView.center.x * 0.53, y: self.numberView.center.x * 0.53)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor(red:0.85, green:0.93, blue:0.69, alpha:1.00).cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        self.numberView.layer .addSublayer(self.shapeLayer)
        
        self.strokeEndAnimationFrom(fromValue: 0, toValue: 0, layer: self.shapeLayer, duration: 1)
    }

    @IBAction func startAnimation(_ sender: UIButton) {
        self.tf_number.resignFirstResponder()
        if (self.tf_number.text?.isEmpty)! {
            return;
        }
        let number = Float(self.tf_number.text!)
        
        print("怒麼日本：\(String(describing: number))")
        guard number! < 100 || number! > 0 else {
            return;
        }
        
        self.strokeEndAnimationFrom(fromValue: 0, toValue: number! / 100, layer: self.shapeLayer, duration: 2)
        self.percent.text = String(format: "%.0f%%",number!)
    }
    
    func strokeEndAnimationFrom(fromValue:Any,toValue:Any,layer:CALayer,duration:CGFloat){
        let strokeEndAnimation = CABasicAnimation.init(keyPath:"strokeEnd")
        strokeEndAnimation.duration = CFTimeInterval(duration)
        strokeEndAnimation.fromValue = fromValue
        strokeEndAnimation.toValue = toValue
        strokeEndAnimation.fillMode = kCAFillModeForwards
        strokeEndAnimation.isRemovedOnCompletion = false
        layer.add(strokeEndAnimation, forKey: nil)
    }

    

}

