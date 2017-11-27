//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/27.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController,UIAccelerometerDelegate {
    
    
    @IBOutlet weak var ball: UIImageView!
    var speedX:UIAccelerationValue = 0
    var speedY:UIAccelerationValue = 0
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //放一个小球在中央
        self.ball.center = self.view.center
        //更新频率
        motionManager.accelerometerUpdateInterval = 0.02
        //判断加速计是否可用
        if motionManager.isAccelerometerAvailable {
            let queue = OperationQueue.current
            motionManager.startAccelerometerUpdates(to: queue!, withHandler: {
                (accelerometerData, error) in
                //动态设置小球位置
                self.speedX += accelerometerData!.acceleration.x
                self.speedY +=  accelerometerData!.acceleration.y
                var posX=self.ball.center.x + CGFloat(self.speedX)
                var posY=self.ball.center.y - CGFloat(self.speedY)
                //碰到边框后的反弹处理
                if posX<0 {
                    posX=0;
                    //碰到左边的边框后以0.4倍的速度反弹
                    self.speedX *= -0.4
                    
                }else if posX > self.view.bounds.size.width {
                    posX=self.view.bounds.size.width
                    //碰到右边的边框后以0.4倍的速度反弹
                    self.speedX *= -0.4
                }
                if posY<0 {
                    posY=0
                    //碰到上面的边框不反弹
                    self.speedY *= -0.4
                } else if posY>self.view.bounds.size.height{
                    posY=self.view.bounds.size.height
                    //碰到下面的边框以1.5倍的速度反弹
                    self.speedY *= -0.4
                }
                self.ball.center = CGPoint(x:posX, y:posY)
            })
        }
    }


}

