//
//  ViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/11/13.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    private var gifurl:NSURL! // 把本地图片转化成URL
    private var imageArr:Array<CGImage> = [] // 图片数组(存放每一帧的图片)
    private var timeArr:Array<NSNumber> = [] // 时间数组(存放每一帧的图片的时间)
    private var totalTime:Float = 0 // gif动画时间
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gifurl = Bundle.main.url(forResource: "123", withExtension: "gif")! as NSURL
        let gifSource = CGImageSourceCreateWithURL(self.gifurl as CFURL, nil)
        let imageCount = CGImageSourceGetCount(gifSource!)
        
        for i in 0..<imageCount{
            let imageRef = CGImageSourceCreateImageAtIndex(gifSource!, i, nil)
            self.imageArr.append(imageRef!)
            
            let sourceDict = CGImageSourceCopyPropertiesAtIndex(gifSource!, i, nil) as NSDictionary!
            let gifDict = sourceDict![String(kCGImagePropertyGIFDictionary)] as! NSDictionary!
            let time = gifDict![String(kCGImagePropertyGIFUnclampedDelayTime)] as! NSNumber// 每一帧的动画时间
            self.timeArr.append(time)
            self.totalTime += time.floatValue
        }
        
        self.showAnimation()
    }
    
    /**
     *  展示动画
     */
    private func showAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "contents")
        var current:Float = 0
        var timeKeys:Array<NSNumber> = []
        
        for time in timeArr {
            timeKeys.append(NSNumber(value: current/totalTime))
            current += time.floatValue
        }
        animation.keyTimes = timeKeys
        animation.values = imageArr
        animation.repeatCount = HUGE;
        animation.duration = TimeInterval(totalTime)
        animation.isRemovedOnCompletion = false
        self.imageView.layer.add(animation, forKey: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

