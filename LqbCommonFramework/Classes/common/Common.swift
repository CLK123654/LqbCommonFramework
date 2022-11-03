//
//  Common.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

public let NC = NotificationCenter.default
public let UD = UserDefaults.standard


// MARK: - 屏幕
/// 屏幕底部安全高度
public let kSafeBottomH: CGFloat = UIScreen.isiPhoneXMore() ? 34 : 0
/// 导航栏高度
public let kNavigationbarH: CGFloat = UIScreen.isiPhoneXMore() ? 88 : 64
/// 屏幕底部方便X点击高度
public let kUseXBottomH: CGFloat = UIScreen.isiPhoneXMore() ? 20 : 0
/// 状态栏高度
public let kStatubarH: CGFloat = UIScreen.isiPhoneXMore() ? 44 : 20
/// Tabbar高度
public let kTabbarH: CGFloat = 49
/// 屏幕的高（旋转屏幕有效）
public let kScreenH = UIScreen.kHeight
/// 屏幕的宽（旋转屏幕有效）
public let kScreenW = UIScreen.kWidth
/// 屏幕的Bounds
public let kScreenB = UIScreen.main.bounds
/// 通用的Empty HeaderView、FooterView的高度
public let kEmptyHeaderViewAndFooterViewH: CGFloat = 0.001

func LqbScreenWidth(num:CGFloat) -> CGFloat {
    return num*kScreenW/375.0
}

func LqbScreenHeight(num:CGFloat) -> CGFloat {
    return num*kScreenH/667.0
}

func LqbLog(_ items: Any...,
    separator: String = "\n",
    terminator: String = "\n",
    file: String = #file,
    function: String = #function,
    line: Int = #line)
{
    #if DEBUG
    let filenime = (file as NSString).lastPathComponent
    let timeDate = "[\(String.getLocalTimeWith("yyyy-MM-dd HH:mm:ss"))]"
    print("开始打印:\n[时间]:\(timeDate)\n[文件名]:[\(filenime)]\n[方法名]:[\(function)]\n[行号]:[\(line)]")
    print("[打印对象的数量]:[\(items.count)]")
    var i = 0
    let j = items.count
    for item in items {
        i += 1
        print(item, terminator: (i == j ? terminator : separator))
    }
    //换行
    print()
    #endif
}

// MARK: - 通用方法集合
/// 简写IMG
public func IMG(_ imgName: String) -> UIImage {
    return UIImage(named: imgName) ?? UIImage()
}

/// 复制字符串
public func CopyAction(_ str: String) {
    UIPasteboard.general.string = str
}

func isiPhoneXMore() -> Bool {
    if #available(iOS 11.0, *) {
        return UIApplication.shared.mainWindow()!.safeAreaInsets.bottom > 0
    } else {
        return false
    }
}

