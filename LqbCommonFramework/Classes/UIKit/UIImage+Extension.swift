//
//  UIImage+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit
import Photos

// MARK: - 基本的拓展
extension UIImage {
    
    /// 设置临时图片
    public func setTemplateImg() -> UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    
    /// 原图像
    public func setOriginalImg() -> UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
    
    /// 给我一个颜色，还你一个图片
    public class func imgWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        /// 开始绘制
        UIGraphicsBeginImageContext(rect.size)
        
        /// 获取当前上下文
        let context = UIGraphicsGetCurrentContext()
        /// 上下文获取该颜色
        context?.setFillColor(color.cgColor)
        /// 用这个颜色填充这个上下文
        context?.fill(rect)
        
        //从这段上下文中获取Image
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        /// 结束绘制
        UIGraphicsEndImageContext()
        
        return img ?? UIImage()
    }
    
    public class func fullResolutionImageData(asset: PHAsset) -> UIImage? {
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.resizeMode = .none
        options.isNetworkAccessAllowed = false
        options.version = .current
        var image: UIImage? = nil
        _ = PHCachingImageManager().requestImageData(for: asset, options: options) { (imageData, dataUTI, orientation, info) in
            if let data = imageData {
                image = UIImage(data: data)
            }
        }
        return image
    }
    
    //view转图片
    public class func imageWithView(_ view: UIView) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        var image: UIImage?
        if let currentContent = UIGraphicsGetCurrentContext() {
            view.layer.render(in: currentContent)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
 
}
