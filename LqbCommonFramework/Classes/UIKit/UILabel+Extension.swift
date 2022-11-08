//
//  UILabel+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension UILabel {
    
    /// 自定义UILabel初始化
    @objc convenience init(text: String? = nil, textColor: UIColor? = nil, font: UIFont? = nil, bgColor: UIColor? = nil) {
        
        self.init()
        //设置标题颜色
        if let color = textColor {
            self.textColor = color
        }
        // 设置文本
        if let textStr = text {
            self.text = textStr
        }
        //设置字体
        if let fontResult = font {
            self.font = fontResult
        }
        //设置背景颜色
        if let bgColorResult = bgColor {
            self.backgroundColor = bgColorResult
        }
        
    }
}

private var is_copyEnabled = false
extension UILabel {
    public var isCopyEnabled: Bool {
        get{
            return objc_getAssociatedObject(self, &is_copyEnabled) as! Bool
        }
        set{
            objc_setAssociatedObject(self, &is_copyEnabled, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            attachTapHandler()
        }
    }
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UILabel.copyText(sender:))
    }
    
    public func attachTapHandler() {
        self.isUserInteractionEnabled = true
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(UILabel.handleTap(ges:)))
        self.addGestureRecognizer(longPress)
    }
    
    @objc public func handleTap(ges: UIGestureRecognizer) {
        if ges.state == .began {
            becomeFirstResponder()
            let item = UIMenuItem(title: "复制", action: #selector(UILabel.copyText(sender:)))
            UIMenuController.shared.menuItems = [item]
            //计算label真实frame，让复制显示在中间
            let rect = (text! as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height:self.bounds.size.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font ?? UIFont.systemFont(ofSize: 16)], context: nil)
            let width = rect.size.width > self.bounds.size.width ? self.bounds.size.width : rect.size.width
            let frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: width, height: self.frame.size.height)
            UIMenuController.shared.setTargetRect(frame, in: self.superview!)
            UIMenuController.shared.setMenuVisible(true, animated: true)
        }
        
    }
    
    @objc public func copyText(sender: Any) {
        //通用粘贴板
        let pBoard = UIPasteboard.general
        //有时候只想取UILabel的text中一部分
        if objc_getAssociatedObject(self, "expectedText") != nil {
            pBoard.string = objc_getAssociatedObject(self, "expectedText") as! String?
        } else {
            if self.text != nil {
                pBoard.string = self.text
            } else {
                pBoard.string = self.attributedText?.string
            }
        }
    }
    
    open override var canBecomeFirstResponder: Bool{
        return isCopyEnabled
    }
    
}
