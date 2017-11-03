//
//  ViewController.swift
//  FifthDemo
//
//  Created by 姜开棋 on 2017/11/3.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var selectedCell:ImageCell!
    
    let imageAry:NSArray = ["1.jpg","2.jpg","4.jpg","5.jpg","6.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        ///collecitonView
        self.collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width * 0.5,height: UIScreen.main.bounds.size.width * 0.5)
        self.collectionView.collectionViewLayout = layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageAry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
       
        cell.imageView.image = UIImage.init(named: self.imageAry[indexPath.row] as! String)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = collectionView.cellForItem(at: indexPath) as! ImageCell
        
        let imageStr = self.imageAry[indexPath.row] as! String
        self.performSegue(withIdentifier: "ToDetailViewController", sender: imageStr)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailViewController"{
            let imageStr = sender as! String
            
            let detail = segue.destination as! DetailViewController
            detail.imageStr = imageStr
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return MagicMoveTransion()
        } else {
            return nil
        }
    }
    
    
    
}

