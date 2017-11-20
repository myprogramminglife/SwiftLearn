//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/20.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

let kWidth = UIScreen.main.bounds.size.width
let kHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    //背景天空
    var bglayer:CAGradientLayer = {
        var layer = CAGradientLayer.init()
        layer.frame = UIScreen.main.bounds
        layer.colors = [UIColor(red:0.30, green:0.62, blue:0.91, alpha:1.00).cgColor,UIColor(red:0.47, green:0.73, blue:0.85, alpha:1.00).cgColor,UIColor(red:0.67, green:0.82, blue:0.89, alpha:1.00).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.locations = [0.25,0.5,0.75,1.00]
        return layer
    }()
    
    //云朵
    var cloudsLayer:CALayer = {
        var layer = CALayer.init()
        layer.frame = CGRect(x: 0, y: 0, width: 64, height: 20)
        layer.position = CGPoint(x: kWidth * 0.5, y: 50)
        layer.contents = UIImage.init(named: "cloud")?.cgImage
        return layer
    }()
    
    //绿地
    var lawnRightLayer:CAShapeLayer = {
        let path = UIBezierPath.init()
        path.lineWidth = 2
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = CGLineJoin.round
        path.move(to: CGPoint(x: kWidth, y: kHeight))
        path.addQuadCurve(to: CGPoint(x: 0, y: kHeight), controlPoint: CGPoint(x: kWidth + 100, y: 200))
        
        var layer = CAShapeLayer.init()
        layer.strokeColor = UIColor(red:0.45, green:0.75, blue:0.71, alpha:1.00).cgColor
        layer.fillColor = UIColor(red:0.45, green:0.75, blue:0.71, alpha:1.00).cgColor
        layer.path = path.cgPath
        return layer
    }()
    
    var lawnLeftLayer:CAShapeLayer = {
        let path = UIBezierPath.init()
        path.lineWidth = 2
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = CGLineJoin.round
        path.move(to: CGPoint(x: 0, y: kHeight))
        path.addQuadCurve(to: CGPoint(x: 200, y: kHeight), controlPoint: CGPoint(x: -100, y: 200))
        
        var layer = CAShapeLayer.init()
        layer.strokeColor = UIColor(red:0.45, green:0.75, blue:0.71, alpha:1.00).cgColor
        layer.fillColor = UIColor(red:0.45, green:0.75, blue:0.71, alpha:1.00).cgColor
        layer.path = path.cgPath
        return layer
    }()
    
    //大地
    var landLayer:CALayer = {
        var layer = CALayer.init()
        layer.frame = CGRect(x: 0, y: 0, width: kWidth, height: 20)
        layer.position = CGPoint(x: kWidth * 0.5, y: kHeight - 10)
        layer.contents = UIImage.init(named: "mud")?.cgImage
        return layer
    }()
    
    //小树
    var treeAry:NSMutableArray = {
        var array = NSMutableArray.init()
        
        for i in 0...8{
            var layer = CALayer.init()
            layer.frame = CGRect(x: 0, y: 0, width: 18, height: 31.5)
            layer.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(kWidth))), y: kHeight - 50)
            layer.contents = UIImage.init(named: "tree")?.cgImage
            array.add(layer)
        }
        return array
    }()
    
    //大山
    var mountainLeftLayer:CAShapeLayer = {
        let path = UIBezierPath.init()
        path.lineWidth = 2
        path.lineCapStyle = CGLineCap.butt
        path.lineJoinStyle = CGLineJoin.round
        path.move(to: CGPoint(x: 0, y: kHeight - 30))
        path.addLine(to: CGPoint(x: 100, y: kHeight - 200))
        path.addLine(to: CGPoint(x: 300, y: kHeight - 30))
        
        var layer = CAShapeLayer.init()
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.path = path.cgPath
        return layer
    }()
    
    var mountainRightLayer:CAShapeLayer = {
        let path = UIBezierPath.init()
        path.lineWidth = 2
        path.lineCapStyle = CGLineCap.butt
        path.lineJoinStyle = CGLineJoin.round
        path.move(to: CGPoint(x: 250, y: kHeight - 30))
        path.addLine(to: CGPoint(x: 360, y: kHeight - 150))
        path.addLine(to: CGPoint(x: 500, y: kHeight - 30))
        
        
        var layer = CAShapeLayer.init()
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.path = path.cgPath
        return layer
    }()
    
    //黄色轨道
    var yellowLayer:CAShapeLayer = {
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 0, y: kHeight - 60))
        path.addCurve(to: CGPoint(x: kWidth / 1.5, y: kHeight / 2 - 20), controlPoint1: CGPoint(x: kWidth / 6.0, y: kHeight - 200), controlPoint2: CGPoint(x: kWidth / 3.0, y: kHeight + 50))
        path.addQuadCurve(to: CGPoint(x: kWidth + 50, y: kHeight / 3.0), controlPoint: CGPoint(x: kWidth - 100, y:  50))
        path.addLine(to: CGPoint(x: kWidth + 10, y: kHeight + 10))
        path.addLine(to: CGPoint(x: 0, y: kHeight + 10))
        
        let layer = CAShapeLayer.init()
        layer.strokeColor = UIColor(red:0.93, green:0.79, blue:0.31, alpha:1.00).cgColor
        layer.lineWidth = 5
        layer.path = path.cgPath
        layer.fillColor = UIColor.init(patternImage: UIImage.init(named: "yellowTrack")!).cgColor
        
        let trackLine = CAShapeLayer.init()
        trackLine.lineCap = "round"
        trackLine.strokeColor = UIColor.white.cgColor
        trackLine.lineDashPattern = [1.0,6.0]
        trackLine.lineWidth = 2.5
        trackLine.fillColor = UIColor.clear.cgColor
        trackLine.path = path.cgPath;
        layer.addSublayer(trackLine)
        return layer
    }()
    
    //绿色轨道
    var greenLayer:CAShapeLayer = {
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: kWidth + 10
            , y: kHeight - 20))
        path.addLine(to: CGPoint(x: kWidth + 10, y: kHeight - 70))
        path.addQuadCurve(to: CGPoint(x: kWidth / 1.5, y: kHeight - 70), controlPoint: CGPoint(x: kWidth - 150, y:  200))
        path.addArc(withCenter: CGPoint(x: kWidth / 1.6, y:  kHeight - 140), radius: 70, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(2.5 * Double.pi), clockwise: true)
        path.addCurve(to: CGPoint(x: 0, y: kHeight  - 100), controlPoint1: CGPoint(x: kWidth / 1.8, y: kHeight - 60), controlPoint2: CGPoint(x: 150, y: kHeight / 2.3))
        path.addLine(to: CGPoint(x: -10, y: kHeight - 20))
        
        let layer = CAShapeLayer.init()
        layer.strokeColor = UIColor(red:0.30, green:0.64, blue:0.68, alpha:1.00).cgColor
        layer.lineWidth = 5
        layer.path = path.cgPath
        layer.fillColor = UIColor.init(patternImage: UIImage.init(named: "greenTrack")!).cgColor
        
        let trackLine = CAShapeLayer.init()
        trackLine.lineCap = "round"
        trackLine.strokeColor = UIColor.white.cgColor
        trackLine.lineDashPattern = [1.0,6.0]
        trackLine.lineWidth = 2.5
        trackLine.fillColor = UIColor.clear.cgColor
        trackLine.path = path.cgPath;
        layer.addSublayer(trackLine)
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addLayer()
        self.addZdLayer()
        self.startAnimation()
    }
    
    //添加layer
    private func addLayer(){
        self.view.layer.addSublayer(self.bglayer)
        self.view.layer.addSublayer(self.cloudsLayer)
        self.view.layer.addSublayer(self.mountainLeftLayer)
        self.view.layer.addSublayer(self.mountainRightLayer)
        self.view.layer.addSublayer(self.lawnRightLayer)
        self.view.layer.addSublayer(self.lawnLeftLayer)
        self.view.layer.addSublayer(self.yellowLayer)
        self.view.layer.addSublayer(self.greenLayer)
        self.view.layer.addSublayer(self.landLayer)
        for i in 0..<self.treeAry.count{
            self.view.layer.addSublayer(self.treeAry[i] as! CALayer)
        }
    }
    
    //动画开始
    private func startAnimation(){
        self.cloudsAnimation()
        self.carAnimtaion(layer: self.yellowLayer)
        self.carAnimtaion(layer: self.greenLayer)
    }

}

extension ViewController{
    //云朵动画
    func cloudsAnimation(){
        let animation = CABasicAnimation.init(keyPath: "position")
        animation.toValue = CGPoint(x: 0, y: self.cloudsLayer.frame.origin.y)
        animation.fillMode = kCAFillModeForwards
        animation.duration = 10.0
        animation.repeatCount = MAXFLOAT
        self.cloudsLayer.add(animation, forKey: nil)
    }
    
    //小车动画
    func carAnimtaion(layer:CAShapeLayer){
        let carLayer = CALayer.init()
        if layer == self.yellowLayer {
            carLayer.contents = UIImage.init(named: "otherTrain")?.cgImage
        }else{
            carLayer.contents = UIImage.init(named: "train")?.cgImage
        }
        carLayer.frame = CGRect(x: 0, y: 0, width: 17, height: 11)
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = layer.path
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationPaced;
        animation.rotationMode = kCAAnimationRotateAuto;
        
        carLayer.add(animation, forKey: nil)
        layer.addSublayer(carLayer)
        
    }
    
    //添加遮挡
    func addZdLayer(){
        //添加遮挡
        let leftzdPath = UIBezierPath.init()
        leftzdPath.lineWidth = 20
        leftzdPath.lineCapStyle = CGLineCap.round
        leftzdPath.lineJoinStyle = CGLineJoin.round
        leftzdPath.move(to: calculateWithXValue(xvalue: 50, startPoint: CGPoint(x: 0, y: kHeight - 30), endpoint: CGPoint(x: 100, y: kHeight - 200)))
        leftzdPath.addLine(to: CGPoint(x: 150, y: kHeight - 100))
        leftzdPath.addLine(to: CGPoint(x: 300, y: kHeight - 30))
        leftzdPath.addLine(to: CGPoint(x: 0, y: kHeight - 30))
        let leftzdlayer = CAShapeLayer.init()
        leftzdlayer.strokeColor = UIColor(red:0.57, green:0.35, blue:0.07, alpha:1.00).cgColor
        leftzdlayer.fillColor = UIColor(red:0.57, green:0.35, blue:0.07, alpha:1.00).cgColor
        leftzdlayer.path = leftzdPath.cgPath
        self.mountainLeftLayer.addSublayer(leftzdlayer)
        
        let rightzdPath = UIBezierPath.init()
        rightzdPath.lineWidth = 20
        rightzdPath.lineCapStyle = CGLineCap.round
        rightzdPath.lineJoinStyle = CGLineJoin.round
        rightzdPath.move(to: calculateWithXValue(xvalue: 80, startPoint: CGPoint(x: 250, y: kHeight - 30), endpoint: CGPoint(x: 360, y: kHeight - 150)))
        rightzdPath.addLine(to: CGPoint(x: 360, y: kHeight - 100))
        rightzdPath.addLine(to: CGPoint(x: 500, y: kHeight - 30))
        rightzdPath.addLine(to: CGPoint(x: 250, y: kHeight - 30))
        let rightzdlayer = CAShapeLayer.init()
        rightzdlayer.strokeColor = UIColor(red:0.57, green:0.35, blue:0.07, alpha:1.00).cgColor
        rightzdlayer.fillColor = UIColor(red:0.57, green:0.35, blue:0.07, alpha:1.00).cgColor
        rightzdlayer.path = rightzdPath.cgPath
        self.mountainRightLayer.addSublayer(rightzdlayer)
    }
    
    //获取山边缘的点
    func calculateWithXValue( xvalue:CGFloat, startPoint:CGPoint, endpoint:CGPoint) -> CGPoint{
        //    求出两点连线的斜率
        let k = (endpoint.y - startPoint.y) / (endpoint.x - startPoint.x);
        let b = startPoint.y - startPoint.x * k;
        let yvalue = k * xvalue + b;
        return CGPoint(x: xvalue, y: yvalue)
    }

}



