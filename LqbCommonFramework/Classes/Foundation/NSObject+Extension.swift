//
//  NSObject+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

// MARK: - 基本的拓展
extension NSObject {
    
    /// 获取“类”的属性列表
    public func propertyList() -> [String] {
        var count: UInt32 = 0
        let list = class_copyPropertyList(self.classForCoder, &count)
        let className = String(describing: self.classForCoder).components(separatedBy: ".").last ?? ""
        #if DEBUG
        print("\(className) 的属性数量\(count)")
        #endif
        var result_list = [String]()
        for i in 0..<Int(count) {
            // 根据下标 获取属性
            if let a = list?[i] {
                // 获取属性的名称
                let cName = property_getName(a)
                let str = String(utf8String: cName)
                result_list.append(str ?? "")
            }
        }
        #if DEBUG
        print("🤡 \(className)的属性列表：\n", result_list)
        #endif
        return result_list
    }
}

extension NSObject {
    /// Exchange two selectors
    ///
    /// - Parameters:
    ///   - originalSelector: The original selector
    ///   - swizzledSelector: A new selector
    public class func exchangeImplementations(originalSelector: Selector, swizzledSelector: Selector) {
        guard
            let originalMethod = class_getInstanceMethod(self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            else {
                print("Error: Unable to exchange method implemenation!!")
                return
        }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
