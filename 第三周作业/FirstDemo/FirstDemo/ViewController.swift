//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/1.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    @IBOutlet weak var page: UIPageControl!
    
    let ary_number:Array = ["1","2","3","4","5","6","7","8","9","10"]
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemW = (UIScreen.main.bounds.size.width - 50) * 0.25
        self.page.currentPage = 0
        self.height.constant = itemW * 2 + 30
        
        let layout = NumberLayout()
        self.collection.register(NumberCell.self, forCellWithReuseIdentifier: "NumberCell")
        self.collection.collectionViewLayout = layout
      //  self.collection.isPagingEnabled = true
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ary_number.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCell", for: indexPath) as! NumberCell
        
        cell.label.text = self.ary_number[indexPath.item]
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.page.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
    }
 
}

