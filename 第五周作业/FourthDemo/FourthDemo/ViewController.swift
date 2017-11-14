//
//  ViewController.swift
//  FourthDemo
//
//  Created by 姜开棋 on 2017/11/14.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

let duration:CGFloat = 1

class ViewController: UIViewController,CAAnimationDelegate {
    
    
    @IBOutlet weak var bgView: UIView!
    
    var greenLayer:CAShapeLayer!
    var blueLayer:CAShapeLayer!
    var yellowLayer:CAShapeLayer!
    var pinkLayer:CAShapeLayer!
    var first:Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.createGreenLayer()
        self.createYellowLayer()
        self.createBlueLayer()
        self.createPinkLayer()
        
        self.showAnimation()
    }

    ///创建绿色layer
    func createGreenLayer(){
        let wh = self.bgView.frame.size.width
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x:wh * 0.55, y: wh * 0.85))
        path.addLine(to: CGPoint(x:wh * 0.25, y: wh * 0.35))
        
        self.greenLayer = CAShapeLayer.init()
        self.greenLayer.path = path.cgPath
        self.greenLayer.fillColor = UIColor.clear.cgColor
        self.greenLayer.strokeColor = UIColor(red:0.45, green:0.75, blue:0.71, alpha:1.00).cgColor
        self.greenLayer.lineWidth = 30
        self.greenLayer.lineCap = kCALineCapRound
        self.greenLayer.lineJoin = kCALineJoinRound
        self.bgView.layer.addSublayer(self.greenLayer)
    }
    
    ///创建黄色layer
    func createYellowLayer(){
        let wh = self.bgView.frame.size.width
        let path = UIBezierPath.init()
        path.move(to:CGPoint(x:wh * 0.45, y: wh * 0.2) )
        path.addLine(to: CGPoint(x:wh * 0.75, y: wh * 0.7))
        
        self.yellowLayer = CAShapeLayer.init()
        self.yellowLayer.path = path.cgPath
        self.yellowLayer.fillColor = UIColor.clear.cgColor
        self.yellowLayer.strokeColor = UIColor(red:0.86, green:0.72, blue:0.44, alpha:1.00).cgColor
        self.yellowLayer.lineWidth = 30
        self.yellowLayer.lineCap = kCALineCapRound
        self.yellowLayer.lineJoin = kCALineJoinRound
        self.bgView.layer.addSublayer(self.yellowLayer)
    }
    
    ///创建蓝色layer
    func createBlueLayer(){
        let wh = self.bgView.frame.size.width
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x:wh * 0.7, y: wh * 0.25))
        path.addLine(to: CGPoint(x:wh * 0.2, y: wh * 0.6))
        
        self.blueLayer = CAShapeLayer.init()
        self.blueLayer.path = path.cgPath
        self.blueLayer.fillColor = UIColor.clear.cgColor
        self.blueLayer.strokeColor = UIColor(red:0.50, green:0.67, blue:0.73, alpha:1.00).cgColor
        self.blueLayer.lineWidth = 30
        self.blueLayer.lineCap = kCALineCapRound
        self.blueLayer.lineJoin = kCALineJoinRound
        self.bgView.layer.addSublayer(self.blueLayer)
    }
    
    ///创建粉红色layer
    func createPinkLayer(){
        let wh = self.bgView.frame.size.width
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x:wh * 0.35, y: wh * 0.8))
        path.addLine(to: CGPoint(x:wh * 0.85, y: wh * 0.45))
        
        self.pinkLayer = CAShapeLayer.init()
        self.pinkLayer.path = path.cgPath
        self.pinkLayer.fillColor = UIColor.clear.cgColor
        self.pinkLayer.strokeColor = UIColor(red:0.90, green:0.28, blue:0.45, alpha:1.00).cgColor
        self.pinkLayer.lineWidth = 30
        self.pinkLayer.lineCap = kCALineCapRound
        self.pinkLayer.lineJoin = kCALineJoinRound
        self.bgView.layer.addSublayer(self.pinkLayer)
    }
    
     func showAnimation() {
        self.strokeEndAnimationFrom(fromValue: 1, toValue: 0, layer: self.greenLayer, duration: duration, key:"a")
        self.strokeEndAnimationFrom(fromValue: 1, toValue: 0, layer: self.blueLayer, duration: duration, key:"a")
        self.strokeEndAnimationFrom(fromValue: 1, toValue: 0, layer: self.yellowLayer, duration: duration, key:"a")
        self.strokeEndAnimationFrom(fromValue: 1, toValue: 0, layer: self.pinkLayer, duration: duration, key:"a")
        self.transformAnimationFrom(toValue: Double.pi * 2 , layer: self.bgView.layer, duration: duration)
    }
    
    ///路线
    func strokeEndAnimationFrom(fromValue:Any,toValue:Any,layer:CALayer,duration:CGFloat,key:String){
        let strokeEndAnimation = CABasicAnimation.init(keyPath:"strokeEnd")
        strokeEndAnimation.duration = CFTimeInterval(duration)
        strokeEndAnimation.fromValue = fromValue
        strokeEndAnimation.toValue = toValue
        strokeEndAnimation.fillMode = kCAFillModeForwards
        strokeEndAnimation.isRemovedOnCompletion = false
        strokeEndAnimation.delegate = self
        layer.add(strokeEndAnimation, forKey: key)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.showAnimation()
    }
    
    ///旋转
    func transformAnimationFrom(toValue:Any,layer:CALayer,duration:CGFloat){
        let strokeEndAnimation = CABasicAnimation.init(keyPath:"transform.rotation.z")
        strokeEndAnimation.toValue = toValue
    
        let animationGrop = CAAnimationGroup.init()
        animationGrop.animations = [strokeEndAnimation]
        animationGrop.duration = CFTimeInterval(duration)
        animationGrop.fillMode = kCAFillModeForwards
        animationGrop.isRemovedOnCompletion = false
        layer.add(animationGrop, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim == self.greenLayer.animation(forKey: "a"){
            let animation = CAKeyframeAnimation.init(keyPath: "transform")
            animation.values = [CATransform3DMakeScale(0.8, 0.8, 0.8),CATransform3DMakeScale(1, 1, 1)]
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            animation.delegate = self
            animation.duration = CFTimeInterval(duration)
            self.bgView.layer.add(animation, forKey: "spring")
        }else if anim == self.bgView.layer.animation(forKey: "spring"){
            self.strokeEndAnimationFrom(fromValue: 0, toValue: 1, layer: self.greenLayer, duration: duration, key:"b")
            self.strokeEndAnimationFrom(fromValue: 0, toValue: 1, layer: self.blueLayer, duration: duration, key:"b")
            self.strokeEndAnimationFrom(fromValue: 0, toValue: 1, layer: self.yellowLayer, duration: duration, key:"b")
            self.strokeEndAnimationFrom(fromValue: 0, toValue: 1, layer: self.pinkLayer, duration: duration, key:"b")

        }
    }

}

