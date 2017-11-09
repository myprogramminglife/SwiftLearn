//
//  ViewController.swift
//  FourthDemo
//
//  Created by 姜开棋 on 2017/11/8.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

    lazy var logolayer:CALayer = {
        let layer = CALayer.init()
        layer.contents = UIImage.init(named:"logo")?.cgImage
        layer.frame = CGRect(x: 0, y: 0, width: 200, height: 160)
        layer.position = self.view.center
        return layer
    }()
    
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.30, green:0.62, blue:0.91, alpha:1.00)
        self.bgImage.layer.mask = self.logolayer
     
        self.animation()
    }
    
    ///动画
    func animation(){
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "bounds"
        animation.duration = 2
        animation.delegate = self
        animation.beginTime = CACurrentMediaTime() + 0.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        // 先缩小后变大
        let begin_bounds = NSValue.init(cgRect: self.logolayer.bounds)
        let middle_bounds = NSValue.init(cgRect: CGRect(x: 0, y: 0, width: 170, height: 150))
        let final_bounds = NSValue.init(cgRect: CGRect(x: 0, y: 0, width: self.logolayer.frame.size.width*100, height: self.logolayer.frame.size.width*100))
        animation.values = [begin_bounds, middle_bounds, final_bounds]
        
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        self.bgImage.layer.mask?.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {

    }
    
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    

    
 
     

}

