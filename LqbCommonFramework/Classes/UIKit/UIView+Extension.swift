//
//  UIView+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

public let kDefalutCornerRadii: CGSize = CGSize(width: 8, height: 8)

extension UIView {
    
    /// x
    public var x: CGFloat {
        get { return frame.origin.x }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    public var y: CGFloat {
        get { return frame.origin.y }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    public var height: CGFloat {
        get { return frame.size.height }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    public var width: CGFloat {
        get { return frame.size.width }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width  = newValue
            frame = tempFrame
        }
    }
    
    /// size
    public var size: CGSize {
        get { return frame.size }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size        = newValue
            frame                 = tempFrame
        }
    }
    
    /// centerX
    public var centerX: CGFloat {
        get { return center.x }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x            = newValue
            center                  = tempCenter
        }
    }
    
    /// centerY
    public var centerY: CGFloat {
        get { return center.y }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y            = newValue
            center                  = tempCenter;
        }
    }
    
    /// bottom
    public var bottom: CGFloat {
        get { return y + height }
        set(newVal) {
            y = newVal - height
        }
    }
    
    /// 移除所有的子视图
    public func clearAllSubViews() {
        if self.subviews.count > 0 {
            self.subviews.forEach { (subV) in
                subV.removeFromSuperview()
            }
        }
    }
    
    /// 设置阴影
    public func setShadow(shadowColor: UIColor, offset: CGSize,
                         opacity: Float , radius: CGFloat) {
        //设置阴影颜色
        self.layer.shadowColor = shadowColor.cgColor
        //设置透明度
        self.layer.shadowOpacity = opacity
        //设置阴影半径
        self.layer.shadowRadius = radius
        //设置阴影偏移量
        self.layer.shadowOffset = offset
    }
    
    /// 渐变色
    public func gradientColor(_ colors: [CGColor], locations: [NSNumber]?, startPoint: CGPoint, endPoint: CGPoint, cornerRadius: CGFloat = 0) {
        let bgLayer1 = CAGradientLayer()
        bgLayer1.colors = colors
        bgLayer1.locations = locations
        bgLayer1.frame = self.bounds
        bgLayer1.startPoint = startPoint
        bgLayer1.endPoint = endPoint
        bgLayer1.masksToBounds = true
        bgLayer1.cornerRadius = cornerRadius
        self.layer.addSublayer(bgLayer1)
    }
        
        /// 将当前视图转为UIImage
    public func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
        
        
        //加载XIB
    public class func initInstanceFromXib<T:UIView>(_ type:T.Type) -> T{
            
        return Bundle.main.loadNibNamed(String(describing: type), owner: self, options: nil)?.first as! T
        
    }


}




/**
 *    针对圆角的拓展
 *    如果是采用SnapKit创建的View, 需要传入具体的roundedSize, 或者在设置圆角前添加 layoutIfNeeded
 *roundedSize: 绘制View本身的大小
 *cornerRadii: 圆角的Size 默认为 CGSize(width: 8, height: 8)
 */
extension UIView {
    
    /// 左上圆角
    public func roundedTopLeft(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.topLeft],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }

    /// 右上圆角
    public func roundedTopRight(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.topRight],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 左下圆角
    public func roundedBottomLeft(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.bottomLeft],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 右下圆角
    public func roundedBottomRight(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.bottomRight],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 底部圆角
    public func roundedBottom(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.bottomRight , .bottomLeft],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 顶部圆角
    public func roundedTop(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.topRight , .topLeft],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 左边圆角
    public func roundedLeft(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.topLeft , .bottomLeft],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 右边圆角
    public func roundedRight(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.topRight , .bottomRight],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    /// 圆角
    public func roundedAllCorner(roundedSize: CGSize? = nil, cornerRadii: CGSize = kDefalutCornerRadii) {
        let maskPath1 = UIBezierPath(roundedRect: roundedSize == nil ? bounds : CGRect(x: 0, y: 0, width: roundedSize!.width, height: roundedSize!.height),
                                     byRoundingCorners: [.topRight , .bottomRight , .topLeft , .bottomLeft],
                                     cornerRadii: cornerRadii)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
}
