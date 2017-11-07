//
//  ViewController.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/11/7.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit



class ViewController: UIViewController,CAAnimationDelegate {

    @IBOutlet weak var left: UIView!
    
    @IBOutlet weak var right: UIView!
    
    @IBOutlet weak var bottom: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        self.left.layer .removeAnimation(forKey: "left")
//        self.right.layer .removeAnimation(forKey: "right")
//        self.bottom.layer .removeAnimation(forKey: "bottom")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        self.addCALayer(view: self.left, key: "left")
        self.addCALayer(view: self.right, key: "right")
        self.addCALayer(view: self.bottom, key: "bottom")
     
    }
    
    func addCALayer(view:UIView,key:String){
        //移动
        let positionAnimation = self.basicAnimationWith(duration: 0.5, fromValue: NSValue.init(cgPoint: view.center), toValue: NSValue.init(cgPoint: CGPoint(x: view.center.x, y: view.center.y + 20)), keyPath: "position")
        //左边变色
        let leftColorAnimation = self.basicAnimationWith(duration: 0.5, fromValue: UIColor(red:0.85, green:0.93, blue:0.69, alpha:1.00).cgColor, toValue: UIColor(red:1.00, green:0.83, blue:0.50, alpha:1.00).cgColor, keyPath: "backgroundColor")
        //右边变色
        let rightColorAnimation = self.basicAnimationWith(duration: 0.5, fromValue: UIColor(red:1.00, green:0.83, blue:0.50, alpha:1.00).cgColor, toValue: UIColor(red:0.85, green:0.93, blue:0.69, alpha:1.00).cgColor, keyPath: "backgroundColor")
        //底部变大
        let bottomAnimation = self.basicAnimationWith(duration: 0.5, fromValue: NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)), toValue: NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 4.0, 1.0)), keyPath: "transform")
        
        
        if key == "left"{
            let group = CAAnimationGroup.init()
            group.animations = [positionAnimation,leftColorAnimation]
            group.duration = 0.5
            group.isRemovedOnCompletion = false
            group.delegate = self
            group.fillMode = kCAFillModeForwards
            view.layer.add(group, forKey: nil)
        }else if key == "right"{
            let group = CAAnimationGroup.init()
            group.animations = [positionAnimation,rightColorAnimation]
            group.duration = 0.5
            group.isRemovedOnCompletion = false
            group.delegate = self
            group.fillMode = kCAFillModeForwards
            view.layer.add(group, forKey: nil)
        }else{
            let group = CAAnimationGroup.init()
            group.animations = [positionAnimation,bottomAnimation]
            group.duration = 0.5
            group.isRemovedOnCompletion = false
            group.delegate = self
            group.fillMode = kCAFillModeForwards
            view.layer.add(group, forKey: nil)
        }
    }
    
    func basicAnimationWith(duration:CGFloat,fromValue:Any,toValue:Any,keyPath:String)-> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: keyPath)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = CFTimeInterval(duration)
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animation
    }
    

}


