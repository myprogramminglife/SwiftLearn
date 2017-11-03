//
//  ViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/11/3.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {


    @IBOutlet weak var collection: UICollectionView!
    
    let imageAry:NSArray = ["1.jpg",
                            "2.jpg",
                            "3.jpg",
                            "4.jpg",
                            "5.jpg"]
    let number:Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        
        let layout = ImageLayout()
       
        self.collection.collectionViewLayout = layout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        
        cell.imageView.image = UIImage.init(named: self.imageAry[Int(arc4random_uniform(5))] as! String)
        return cell
    }
}


