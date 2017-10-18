//
//  RPMainFlowLayout.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPMainFlowLayout: UICollectionViewFlowLayout {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemSize = CGSize(width: 240, height: 320)
        scrollDirection = UICollectionViewScrollDirection.horizontal
        minimumInteritemSpacing = 50.0
        let margin = UIScreen.main.bounds.size.width/2.0 - itemSize.width/2.0
        sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //获取当前所有控件布局
        let attributesArr : [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect)!
        let collectionWindowsCenter = CGFloat((collectionView?.center.x)!) + CGFloat((collectionView?.contentOffset.x)!)
        
        for perAttribute in attributesArr {
            let centerX = perAttribute.center.x
            _ = abs(collectionWindowsCenter - centerX)
            
            let scale3D = (collectionWindowsCenter - centerX)/(collectionView?.center.x)!
//            print(scale3D)
            let rotate = CATransform3DMakeRotation(CGFloat(Double.pi/18)*scale3D, 0, 1, 0)
            perAttribute.transform3D = CATransform3DPerspect(t: rotate, center: CGPoint(x:0, y:0), disZ: 200)
            
        }
        
        return attributesArr
    }

    func CATransform3DPerspect(t : CATransform3D,center : CGPoint, disZ : Float) -> CATransform3D {
        return CATransform3DConcat(t, CATransform3DMakePerspective(center: center, disZ: disZ))
    }
    
    func CATransform3DMakePerspective(center : CGPoint,disZ : Float) -> CATransform3D {
        let transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
        let transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
        var scale = CATransform3DIdentity;
        scale.m34 = CGFloat(-1.0/disZ);
        return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
    }
    
    //是否在bounds发生变化的时候重新计算布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    //设定停止的地方
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var endRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        endRect.origin = proposedContentOffset
        endRect.size = (collectionView?.frame.size)!
        
        let endAttributesArr : [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: endRect)!
//        print(endAttributesArr)
        let endCenter = (collectionView?.center.x)! + proposedContentOffset.x
        var minMargin = CGFloat.greatestFiniteMagnitude
        
        for att in endAttributesArr {
            let margin = att.center.x - endCenter
            if (abs(margin) < abs(minMargin)) {
                minMargin = margin
            }
        }
        
//        print("proposedContentOffset.x")
//        print(proposedContentOffset.x)
        
        return CGPoint(x: proposedContentOffset.x + minMargin, y: proposedContentOffset.y)
    }
    
}
