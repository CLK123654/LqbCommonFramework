//
//  UICollectionView+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

// MARK: - 基本的拓展
extension UICollectionView {
    
    /// 注册Cell
    public func lqb_registerCellClass(_ cellClass: Swift.AnyClass) -> (){
        self.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }

    /// 注册nib Cell
    public func lqb_registerCellNib(_ cellClass: Swift.AnyClass) -> (){
        self.register(UINib.init(nibName: String(describing: cellClass), bundle: nil), forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    /// 拿缓存池的Cell
    public func lqb_deque<T:UICollectionViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as! T
    }
    
    /// 注册HeaderFooter
    public func lqb_registerHeaderFooter<T:UICollectionReusableView>(viewType: T.Type, kind: String) -> () {
        self.register(viewType.classForCoder(), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: viewType))
    }
    
    /// 注册HeaderFooterXib
    public func lqb_registerHeaderFooterXib<T:UICollectionReusableView>(viewType: T.Type, kind: String) -> () {
        self.register(UINib(nibName: String(describing: viewType), bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: viewType))
    }
    
    /// 拿缓存池的HeaderFooter
    public func lqb_dequeHeaderFooter<T:UICollectionReusableView>(_ viewType: T.Type, kind: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: viewType), for: indexPath) as! T
    }
}
