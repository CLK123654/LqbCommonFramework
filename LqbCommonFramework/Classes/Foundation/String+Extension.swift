//
//  String+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

//MARK: - 基本的拓展
extension String {
    
    /** 获取当前时间，指定为公历记法（区别佛历）
     * @param
     * @returnDateFormat: 返回的格式，根据自己想要的格式，例如："yyyy-MM-dd HH:mm:ss"
     */
    static func getLocalTimeWith(_ returnDateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = returnDateFormat
        let locale = Locale.init(identifier: Locale.preferredLanguages[0])
        dateFormatter.locale = locale
        let locationStr = dateFormatter.string(from: Date())
        return locationStr
    }
    
    /// 字符尺寸
    public func stringSize(font: UIFont, w: CGFloat = CGFloat(MAXFLOAT), h: CGFloat = CGFloat(MAXFLOAT)) -> CGSize {
        let strSize = (self as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin,attributes: [NSAttributedString.Key.font: font], context: nil).size
        return strSize
    }
    
    /// 获取一个随机数
    static func getRandomNum() -> String {
        return String(format: "%d", arc4random())
    }
    
    /// 获取一个timestamp
    static func getTimestamp() -> String {
        return String(format: "%.0f", Date().timeIntervalSince1970)
    }
    
    /// 每个中文首字母拼接
    func chineseFirstCharacters(lowercased: Bool) -> String {
        let ostr = NSMutableString.init(string: self)
        CFStringTransform(ostr as CFMutableString, nil, kCFStringTransformMandarinLatin, false)
        CFStringTransform(ostr as CFMutableString, nil, kCFStringTransformStripDiacritics, false)
        return ostr.capitalized.components(separatedBy: " ").map { (str) -> String in
            if str.count >= 1{
                let str_f = (str as NSString).substring(to: 1)
                return lowercased ? str_f.lowercased() : str_f.uppercased()
            }
            return ""
            }.joined(separator: "")
    }
    
    /// 移除最后一个0
    public static func removeZeroAction(_ value: NSNumber) -> String {
        /// 保留2位小数，并移除最后一个0
        var tempStr = String(format: "%.2f", value)
        for _ in tempStr {
            if tempStr.last == "0" {
                tempStr.removeLast()
            }
        }
        return tempStr
    }
    
    // 去掉所有空格
    func removeAllSpace() -> String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    
    /// 将特定字符串放在最前面显示
    public func exchangeSubStringToBegin(_ subStr: String) -> String {
        
        guard contains(subStr) else { return self }
        return String(format: "%@%@", subStr, replacingOccurrences(of: subStr, with: ""))
    }
    
    /// 截断尾数为0的字符串
    public func truncateLastZero() -> String {
        
        guard contains(".") else { return self}
        var tempString = self
        while tempString.last == "0" {
            tempString.removeLast()
        }
        if tempString.last == "." {
            tempString.removeLast()
        }
        return tempString
    }
    
    func trimPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
}

// MARK: - 正则校验字符串
extension String {
    
    public enum ValidateType {
        case phone
        case password
        case pureNumber
        case inviteCode
        case email
    }
    
    // MARK: - let
    public static let PhoneRegexString = "^1([3-9])[0-9]{9}"
    public static let PasswordRegexString = "^[A-Za-z\\d_\\.\\-\\*@#]{6,20}$"
    public static let PureNumberRegexString = "^\\d+$"
    public static let InviteCodeRegexString = "^([0-9]|[a-zA-Z]){8}$"
    public static let EmailRegexString = "^[\\w-]+[\\.\\w-]*@[\\w-]+(\\.[\\w-]{2,3})?(\\.[a-zA-Z]{2,3})$"
    
    // MARK: - public method
    public func validate(type: String.ValidateType) -> Bool {
        if self.isEmpty {
            return false
        }
        var regexString = ""
        switch type {
        case .phone:
            regexString = String.PhoneRegexString
        case .password:
            regexString = String.PasswordRegexString
        case .pureNumber:
            regexString = String.PureNumberRegexString
        case .inviteCode:
            regexString = String.InviteCodeRegexString
        case .email:
            regexString = String.EmailRegexString
        }
        return validate(regexString: regexString)
    }
    
    // MARK: - private method
    fileprivate func validate(regexString: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regexString).evaluate(with: self)
    }
}
