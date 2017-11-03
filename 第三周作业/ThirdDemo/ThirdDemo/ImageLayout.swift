import UIKit

class ImageLayout: UICollectionViewLayout {
    
    
    var hs: Array<CGFloat>!
    
    private var totalNum: Int!
    
    private var layoutAttributes: Array<UICollectionViewLayoutAttributes>!
    
    override func prepare() {
        super.prepare()
        hs = []
        for _ in 0..<2 {
            hs.append(5)
        }
        totalNum = collectionView?.numberOfItems(inSection: 0)
        
        layoutAttributes = []
        
        var indexpath: NSIndexPath!
        
        for index in 0..<totalNum {
            indexpath = NSIndexPath(row: index, section: 0)
            let attributes = layoutAttributesForItem(at: indexpath as IndexPath)
            layoutAttributes.append(attributes!)
        }
    }
    
    
    private let gap:CGFloat = 5//间隔，缝隙大小
    
    private var width:CGFloat!
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        width = (UIScreen.main.bounds.size.width - 5) * 0.5
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        attributes.size = CGSize(width: width, height: CGFloat(max(200, arc4random_uniform(300))))
        
        
        var nub:CGFloat = 0
        var h:CGFloat = 0
        (nub,h) = minH(hhs: hs)
        attributes.center = CGPoint(x:(nub+0.5)*(gap+width), y:h+(width/attributes.size.width*attributes.size.height+gap)/2)
        hs[Int(nub)] = h+width/attributes.size.width*attributes.size.height+gap
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes
    }
    
   
    override var collectionViewContentSize: CGSize {
        get {
            return CGSize(width: (collectionView?.bounds.width)!, height: maxH(hhs: hs))
        }
        set {
            self.collectionViewContentSize = newValue
        }
    }
    
    private func minH(hhs:Array<CGFloat>)->(CGFloat,CGFloat){
        var num = 0
        var min = hhs[0]
        for i in 1..<hhs.count{
            if min>hhs[i] {
                min = hhs[i]
                num = i
            }
        }
        return (CGFloat(num),min)
    }
    
    func maxH(hhs:Array<CGFloat>)->CGFloat{
        var max = hhs[0]
        for i in 1..<hhs.count{
            if max<hhs[i] {
                max = hhs[i]
            }
        }
        return max
    }
}

