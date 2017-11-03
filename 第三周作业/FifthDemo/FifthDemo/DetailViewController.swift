//
//  DetailViewController.swift
//  FifthDemo
//
//  Created by 姜开棋 on 2017/11/3.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UINavigationControllerDelegate {

    private var percentDrivenTransition: UIPercentDrivenInteractiveTransition?
    
    var imageStr:String!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       self.imageView.image = UIImage.init(named: imageStr)
        
        self.navigationController?.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop {
            return MagicMovePopTransion()
        } else {
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is MagicMovePopTransion {
            return self.percentDrivenTransition
        } else {
            return nil
        }
    }
}

/*
 //手势监听器
 let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: Selector(("edgePanGesture:edgePan:")))
 edgePan.edges = UIRectEdge.left
 self.view.addGestureRecognizer(edgePan)
 func edgePanGesture(edgePan: UIScreenEdgePanGestureRecognizer) {
 let progress = edgePan.translation(in: self.view).x / self.view.bounds.width
 
 if edgePan.state == UIGestureRecognizerState.began {
 self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
 self.navigationController?.popViewController(animated: true)
 } else if edgePan.state == UIGestureRecognizerState.changed {
 self.percentDrivenTransition?.update(progress)
 } else if edgePan.state == UIGestureRecognizerState.cancelled || edgePan.state == UIGestureRecognizerState.ended {
 if progress > 0.5 {
 self.percentDrivenTransition?.finish()
 } else {
 self.percentDrivenTransition?.cancel()
 }
 self.percentDrivenTransition = nil
 }
 }
 
 */
