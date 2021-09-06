//
//  UIScreen+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension UIScreen {
    public static var kHeight: CGFloat {
        return self.main.bounds.height >  self.main.bounds.width ? self.main.bounds.height : self.main.bounds.width
    }
    public static var kWidth: CGFloat {
        return self.main.bounds.height <= self.main.bounds.width ? self.main.bounds.height : self.main.bounds.width
    }
    
    public static func isiPhoneXMore() -> Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.mainWindow()!.safeAreaInsets.bottom > 0
        } else {
            return false
        }
    }
}
