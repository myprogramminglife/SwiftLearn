//
//  ViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/11/27.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIDynamicAnimatorDelegate,UIGestureRecognizerDelegate {

    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var ball1: UIImageView!
    @IBOutlet weak var ball2: UIImageView!
    @IBOutlet weak var ball3: UIImageView!
    @IBOutlet weak var ball4: UIImageView!
    
    var snapBehavior:UISnapBehavior!
    var animator:UIDynamicAnimator!
    var attach:UIAttachmentBehavior!
    var gravity:UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加上下文
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        self.animator.delegate = self

        //添加重力
        gravity = UIGravityBehavior.init(items: [self.ball,self.ball1,self.ball2,self.ball3,self.ball4])
        self.animator.addBehavior(gravity)
        
        //添加碰撞
        let collision = UICollisionBehavior.init(items: [self.ball,self.ball1,self.ball2,self.ball3,self.ball4])
        collision.translatesReferenceBoundsIntoBoundary = true
        self.animator.addBehavior(collision)
        
        //添加附加关系
        self.attach = UIAttachmentBehavior.init(item: self.ball, attachedTo: self.ball1)
        self.animator.addBehavior(self.attach)
        
        let attach1 = UIAttachmentBehavior.init(item: self.ball1, attachedTo: self.ball2)
        self.animator.addBehavior(attach1)
        
        let attach2 = UIAttachmentBehavior.init(item: self.ball2, attachedTo: self.ball3)
        self.animator.addBehavior(attach2)
        
        let attach3 = UIAttachmentBehavior.init(item: self.ball3, attachedTo: self.ball4)
        self.animator.addBehavior(attach3)
        
        //添加拖拽手势
        let tap = UIPanGestureRecognizer(target: self, action: #selector(ViewController.tapAction(tap:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func tapAction(tap: UIPanGestureRecognizer){
        let anchorPoint: CGPoint = tap.location(in: self.view)
        
        if let snap = snapBehavior {
            self.animator.removeBehavior(snap)
        }
        self.snapBehavior = UISnapBehavior(item: self.ball, snapTo: anchorPoint)
        self.animator.addBehavior(self.snapBehavior)
        self.attach.anchorPoint = anchorPoint
        
        if tap.state == UIGestureRecognizerState.ended{
            if let snap = snapBehavior {
                self.animator.removeBehavior(snap)
            }
        }
    }

    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        
    }
    
    func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gravity = UIGravityBehavior.init(items: [self.ball,self.ball1,self.ball2,self.ball3,self.ball4])
        self.animator.addBehavior(gravity)
    }

}

