//
//  ViewController.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/11/27.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width
let itemW = (ScreenW - 30) * 0.5

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    
    let images:NSArray = ["http://img.sc115.com/uploads/sc/jpgs/1125apic2146_sc115.com.jpg","http://img.sc115.com/uploads/sc/jpgs/1409/apic6104_sc115.com.jpg","http://f2.topitme.com/2/44/48/11321074391a748442o.jpg","http://img1.3lian.com/2015/w22/48/d/104.jpg","http://img5q.duitang.com/uploads/item/201411/30/20141130235625_H5yuH.jpeg","http://img17.3lian.com/d/file/201703/06/d6542df2e190d95c5bf982a8305f5256.jpg","http://pic1.win4000.com/mobile/f/5615da3058d12.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: itemW, height: itemW)
        self.collection.collectionViewLayout = layout
        self.collection.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.getImage(imageUrl: self.images[indexPath.row] as! String)
        return cell
    }


}

