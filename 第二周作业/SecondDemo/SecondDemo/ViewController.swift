//
//  ViewController.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/10/24.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scr_card: UIScrollView!
    
    let ary_image:NSArray = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"]
    let ary_text:NSArray = ["鸭嘴兽","紫陆寄居蟹","草莓箭毒蛙","菲律宾眼镜猴","萨克森风鸟","龙胆"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let height:CGFloat = self.scr_card.frame.size.height - 30
        let width:CGFloat = height * 0.738
        
        self.scr_card.contentSize = CGSize.init(width: CGFloat(self.ary_image.count)*(width+30)+30, height: height)
        
        for  i in 0...self.ary_image.count - 1{
            self.scr_card.addSubview(CardView.init(frame: CGRect.init(x: 30.0+CGFloat(i)*(width+30), y: 0, width: width, height: height), image:self.ary_image[i] as! String, text: self.ary_text[i] as! String))
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

