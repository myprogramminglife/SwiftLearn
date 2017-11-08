//
//  ViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/11/8.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //图片透明度动画
        UIView.animate(withDuration: 10) {
            self.photo.alpha = 0.0
        }
        
        //心跳
        let animation = self.basicAnimationWith(duration: 1, fromValue: NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)), toValue: NSValue.init(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 0.5)), keyPath: "transform")
        self.label.layer .add(animation, forKey: nil)
        
    }
    
    
    
    func basicAnimationWith(duration:CGFloat,fromValue:Any,toValue:Any,keyPath:String)-> CASpringAnimation{
        let animation = CASpringAnimation.init(keyPath: keyPath)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.delegate = self
        animation.duration = CFTimeInterval(duration)
        animation.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        return animation
    }


    func animationDidStart(_ anim: CAAnimation) {
        print("开始")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("结束")
    }
}

