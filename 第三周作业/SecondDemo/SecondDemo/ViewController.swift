//
//  ViewController.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/11/2.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width
let itemW = (ScreenW - 30) * 0.5

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var number:Int = 10
    
    let imageAry:NSArray = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: itemW,height: itemW)
        self.collection.collectionViewLayout = layout
        self.collection.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        cell.imageView.image = UIImage.init(named: self.imageAry[Int(arc4random_uniform(UInt32(8)))] as! String)
        
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = (itemW+10) * CGFloat(self.number / 2)
        if scrollView.contentOffset.y + UIScreen.main.bounds.size.height + 10 > height{
            self.number += 10
            self.collection.reloadData()
        }
        
        print("\(scrollView.contentOffset.y + UIScreen.main.bounds.size.height + 10) > \(height)  numer:\(self.number)")
    }

}

