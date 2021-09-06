//
//  UITableView+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension UITableView {
    
    /// 注册Cell
    public func lqb_registerCellClass(_ cellClass: Swift.AnyClass) -> (){
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    /// Nib注册Cell
    public func lqb_registerCellNib(_ cellClass: Swift.AnyClass) -> (){
        self.register(UINib.init(nibName: String(describing: cellClass), bundle: nil), forCellReuseIdentifier: String(describing: cellClass))
    }
    
    /// 拿缓存池的Cell
    public func lqb_deque<T:UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
    }
    
    /// 注册HeaderFooter
    public func lqb_registerHeaderFooterClass<T:UITableViewHeaderFooterView>(_ clazz: T.Type) -> (){
        self.register(clazz, forHeaderFooterViewReuseIdentifier: String(describing: clazz))
    }
    
    /// nib注册HeaderFooter
    public func lqb_registerHeaderFooterNib<T:UITableViewHeaderFooterView>(_ clazz: T.Type) -> (){
        let nib = UINib.init(nibName: String(describing: clazz), bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: String(describing: clazz))
    }
    
    /// 拿缓存池的HeaderFooter
    public func lqb_dequeHeaderFooter<T:UITableViewHeaderFooterView>(viewType: T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: viewType)) as! T
    }
    
}
