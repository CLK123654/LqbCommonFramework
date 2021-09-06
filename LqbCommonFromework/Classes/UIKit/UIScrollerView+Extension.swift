//
//  UIScrollerView+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

/**
 * 长截图
 */
extension UIScrollView {
    
    public func screenshot() -> UIImage? {
        
        let savedContentOffset = contentOffset
        let savedFrame = frame
        
        var size = contentSize
        if contentSize.width <= 0 {
            size = CGSize(width: savedFrame.size.width, height: contentSize.height)
        }
        
        contentOffset = CGPoint.zero
        frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        var image: UIImage?
        if let currentContent = UIGraphicsGetCurrentContext() {
            layer.render(in: currentContent)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        //drawHierarchy(in: frame, afterScreenUpdates: false)
        //let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        contentOffset = savedContentOffset
        frame = savedFrame
        
        return image
    }
}
