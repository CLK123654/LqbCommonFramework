//
//  UIButton+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension UIButton {

    /// 自定义UIButton初始化
    public convenience init(title: String? = nil, titleColor: UIColor? = nil, titleFont: UIFont? = nil, titleSize: CGFloat? = nil, bgColor: UIColor? = nil, target: Any? = nil, btnSelector: Selector? = nil, isImgLeftToRight: Bool? = nil) {
        
        self.init()
        if let btnTitle = title {
            self.setTitle(btnTitle, for: .normal)
        }
        if let titleForColor = titleColor {
            self.setTitleColor(titleForColor, for: .normal)
        }
        if let font = titleFont {
            self.titleLabel?.font = font
        }
        if let size = titleSize {
            self.titleLabel?.font = UIFont.systemFont(ofSize: size)
        }
        if let btnBgColor = bgColor {
            self.backgroundColor = btnBgColor
        }
        if let btnTarget = target, let selector = btnSelector {
            self.addTarget(btnTarget, action: selector, for: .touchUpInside)
        }
        if let tempV = isImgLeftToRight, tempV {
            if tempV {
                self.semanticContentAttribute = .forceRightToLeft
            }
        }
    }
}
