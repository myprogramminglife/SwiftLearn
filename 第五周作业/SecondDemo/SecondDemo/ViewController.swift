//
//  ViewController.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/11/13.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CALayer.init()
        layer.frame = CGRect(x: 20, y: 100, width: 20, height: 100)
        layer.backgroundColor = UIColor.orange.cgColor
        self.view.layer.addSublayer(layer)
        
        let animtation = CABasicAnimation.init(keyPath: "transform.scale.y")
        animtation.toValue = 0.2
        animtation.duration = 0.7
        animtation.repeatCount = MAXFLOAT
        layer.add(animtation, forKey: nil)
        
        
        let replicatorLayer = CAReplicatorLayer.init()
        replicatorLayer.instanceCount = 5
        replicatorLayer.preservesDepth = true
        replicatorLayer.instanceDelay = 0.5
        replicatorLayer.instanceTransform =  CATransform3DMakeTranslation(40,0,0)
        replicatorLayer.instanceColor = UIColor.orange.cgColor
        replicatorLayer.instanceRedOffset = -0.3
        replicatorLayer.instanceGreenOffset = -0.3
        replicatorLayer.instanceBlueOffset = -0.3
        replicatorLayer.addSublayer(layer)
        self.view.layer.addSublayer(replicatorLayer)
    }

   


}

