//
//  UIColor+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension UIColor {
    
    /// UIColor 16进制编码转换RGB
    class func lqb_hexColor(_ wt_hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexStr = wt_hex.uppercased()
        if (hexStr.hasPrefix("#")) {
            hexStr = (hexStr as NSString).substring(from: 1)
        }
        let scanner = Scanner(string: hexStr)
        scanner.scanLocation = 0
        var RGBValue: UInt64 = 0
        scanner.scanHexInt64(&RGBValue)
        let r = (RGBValue & 0xff0000) >> 16
        let g = (RGBValue & 0xff00) >> 8
        let b = RGBValue & 0xff
        return UIColor(red: CGFloat(r) / 0xff, green: CGFloat(g) / 0xff, blue: CGFloat(b) / 0xff, alpha: alpha)
    }
    
    /// RGB形式转换Color
    class func lqb_rgbColor(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    // 生成随机颜色
    class func lqb_randomColor() -> UIColor {
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}
