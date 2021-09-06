//
//  UIApplication+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension UIApplication {
    
    /// 拿到window
    @objc func mainWindow() -> UIWindow? {
        return self.delegate?.window ?? nil
    }
    
    /// 拿到当前VC
    @objc func visibleVC() -> UIViewController {
        let rootVC = self.mainWindow()?.rootViewController
        return self.getVisibleVCWith(vc: rootVC ?? UIViewController())
    }
    
    /// 匹配当前VC
    @objc func getVisibleVCWith(vc: UIViewController) -> UIViewController {
        
        if vc.isKind(of: UINavigationController.classForCoder()) {
            return self.getVisibleVCWith(vc: (vc as? UINavigationController)?.visibleViewController ?? UIViewController())
            
        } else if vc.isKind(of: UITabBarController.classForCoder()) {
            return self.getVisibleVCWith(vc: (vc as? UITabBarController)?.selectedViewController ?? UIViewController())
        } else {
            if vc.presentedViewController != nil {
                return self.getVisibleVCWith(vc: vc.presentedViewController ?? UIViewController())
            } else {
                return vc
            }
        }
        
    }
    
    /// 方法取NC
    @objc func visibleNC() -> UINavigationController {
        return self.visibleVC().navigationController ?? UINavigationController()
    }
    
}
