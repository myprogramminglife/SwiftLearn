
//
//  NumberLayout.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/11/2.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

let pageNumber = 4

let lineNumber = 2

let kScreenW = UIScreen.main.bounds.size.width

class NumberLayout: UICollectionViewFlowLayout {
    
    // 保存所有item
    fileprivate var attributesArr: [UICollectionViewLayoutAttributes] = []
    
    // MARK:- 重新布局
    override func prepare() {
        super.prepare()
        
        let itemWH: CGFloat = (UIScreen.main.bounds.size.width - 50) * 0.25
        
        // 设置itemSize
        itemSize = CGSize(width: itemWH, height: itemWH)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        scrollDirection = .horizontal
        
        // 设置collectionView属性
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = true
        let insertMargin = (collectionView!.bounds.height - 2 * itemWH) * 0.5
        collectionView?.contentInset = UIEdgeInsetsMake(10, 10, insertMargin, 10)
        
        
        
        var page = 0
        let itemsCount = collectionView?.numberOfItems(inSection: 0) ?? 0
        for itemIndex in 0..<itemsCount {
            let indexPath = IndexPath(item: itemIndex, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            page = itemIndex / (pageNumber * lineNumber)
            // 通过一系列计算, 得到x, y值
            let x = itemSize.width * CGFloat(itemIndex % Int(pageNumber)) + CGFloat(itemIndex % Int(pageNumber))*10 + (CGFloat(page) * kScreenW) + 10
            let y = itemSize.height * CGFloat((itemIndex - page * lineNumber * pageNumber) / pageNumber) + CGFloat((itemIndex - page * lineNumber * pageNumber) / pageNumber) * 10
          
            attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)
            // 把每一个新的属性保存起来
            attributesArr.append(attributes)
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var rectAttributes: [UICollectionViewLayoutAttributes] = []
        _ = attributesArr.map({
            if rect.contains($0.frame) {
                rectAttributes.append($0)
            }
        })
        return rectAttributes
    }
}

