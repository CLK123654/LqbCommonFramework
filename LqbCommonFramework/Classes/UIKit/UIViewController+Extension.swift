//
//  UIViewController+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

// MARK: - 基本的拓展
extension UIViewController {
    
    /// 系统分享
    public func systemShareAction(title: String? = nil, img: UIImage? = nil, url: String? = nil) {
        var items = [Any]()
        if let text = title {
            items.append(text)
        }
        if let image = img {
            items.append(image)
        }
        
        if let tempUrl = url, let Url = NSURL(string: tempUrl) {
            items.append(Url)
        }
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true) {

        }
    }
    
    /// pop指定类型控制器
    public func popToSpecialViewController(childClass: AnyClass) {
        
        var navigationController: UINavigationController?
        if isKind(of: UINavigationController.classForCoder()) {
            navigationController = self as? UINavigationController
        } else {
            navigationController = self.navigationController
        }
        guard let children = navigationController?.childViewControllers else { return }
        for childVC in children {
            if childVC.isKind(of: childClass) {
                navigationController?.popToViewController(childVC, animated: true)
                break
            }
        }
    }
    
}
