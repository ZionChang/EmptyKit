//
//  UITableView+Empty.swift
//  EmptyKit-Swift
//
//  Created by archerzz on 16/11/16.
//  Copyright © 2016年 archerzz. All rights reserved.
//

import Foundation
import UIKit

/// Keys
private var datasourceKey: Void?
private var delegateKey: Void?
private var emptyViewKey: Void?
private var customViewKey: Void?
private var datasourceMakerKey: Void?
private let emptyImageViewAnimationKey = "emptyImageViewAnimationKey"

// MARK: - Common methods
fileprivate extension UIScrollView {
    
    /**
     swizzle originalSelector imp to swizzledSelector imp
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter originalSelector: originalSelector
     - parameter swizzledSelector: swizzledSelector
     */
    static func swizzle(originalSelector: Selector, to swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!);
        }
    }
    /**
     reload emtpy view
     
     - author: archerzz
     - date: 2016-11-22
     */
    @objc fileprivate func ept_reloadData() {
        guard ept.setupEmptyView(withItemsCount: ept.itemsCount) else {
            return
        }
        // events
        ept.emptyView?.didTappedButton = { [weak self] button in
            guard let strongSelf = self else {
                return
            }
            strongSelf.ept.delegate?.emptyButton(button, tappedIn: strongSelf)
        }
        ept.emptyView?.didTappedEmptyView = { [weak self] view in
            guard let strongSelf = self, let delegate = strongSelf.ept.delegate else {
                return
            }
            if delegate.emptyShouldEnableTapGesture(in: view) {
                delegate.emptyView(view, tappedIn: strongSelf)
            }
        }
    }
}

// MARK: - UITableView Swizzle
extension UITableView {
    
    static let swizzleIfNeeded: () = {
        UITableView.swizzle(originalSelector: #selector(reloadData), to: #selector(swizzle_reloadData))
        UITableView.swizzle(originalSelector: #selector(endUpdates), to: #selector(swizzle_endUpdates))
    }()
    
    @objc fileprivate func swizzle_reloadData() {
        swizzle_reloadData()
        ept_reloadData()
    }
  
    @objc fileprivate func swizzle_endUpdates() {
        swizzle_endUpdates()
        ept_reloadData()
    }
    
}

// MARK: - UICollectionView Swizzle
extension UICollectionView {
    
    static let swizzleIfNeeded: () = {
        UICollectionView.swizzle(originalSelector: #selector(reloadData), to: #selector(swizzle_reloadData))
    }()
    
//    open override class func initialize() {
//        swizzleIfNeeded
//    }
    
    @objc fileprivate func swizzle_reloadData() {
        swizzle_reloadData()
        ept_reloadData()
    }
    
}

// MARK: - Base: UIScrollView Computed Properties
public extension Empty where Base: UIScrollView {
    
    weak var dataSource: EmptyDataSource? {
        get {
            return objc_getAssociatedObject(base, &datasourceKey) as? EmptyDataSource
        }
        set {
            objc_setAssociatedObject(base, &datasourceKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    weak var delegate: EmptyDelegate? {
        get {
            return objc_getAssociatedObject(base, &delegateKey) as? EmptyDelegate
        }
        set {
            objc_setAssociatedObject(base, &delegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    
    fileprivate var customView: UIView? {
        get {
            return objc_getAssociatedObject(base, &customViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(base, &customViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var emptyView: EmptyView? {
        get {
            if let view = objc_getAssociatedObject(base, &emptyViewKey) as? EmptyView {
                return view
            }
            let view = EmptyView()
            view.isHidden = true
            objc_setAssociatedObject(base, &emptyViewKey, view, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return view
        }
        set {
            objc_setAssociatedObject(base, &emptyViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var itemsCount: Int {
        if let tableView = base as? UITableView, let dataSource = tableView.dataSource {
            let sections = dataSource.numberOfSections?(in: tableView) ?? 1
            return itemsCount(in: sections, with: { (section) -> Int in
                return dataSource.tableView(tableView, numberOfRowsInSection: section)
            })
        }
        if let collectionView = base as? UICollectionView, let dataSource = collectionView.dataSource {
            let sections = dataSource.numberOfSections?(in: collectionView) ?? 1
            return itemsCount(in: sections, with: { (section) -> Int in
                return dataSource.collectionView(collectionView, numberOfItemsInSection: section)
            })
        }
        return 0
    }
    
}

// MARK: - Base: UIScrollView Funcs
public extension Empty where Base: UIScrollView {
    
    
    /**
     reload empty view
     
     - author: archerzz
     - date: 2016-11-22
     */
    func reloadData() {
        base.ept_reloadData()
    }
    /**
     calculate the sum of count with a transform in [0..<section]
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter sections:  end section
     - parameter transform: transform
     
     - returns: itemsCount
     */
    fileprivate func itemsCount(in sections: Int, with transform: (Int) -> Int) -> Int {
        var items = 0
        for sectionIndex in 0..<sections {
            if let sectionsToIgnore = dataSource?.sectionsToIgnore(in: base), sectionsToIgnore.contains(sectionIndex) {
                continue
            }
            items += transform(sectionIndex)
        }
        return items
    }
    /**
     invalidate the emptyView
     
     - author: archerzz
     - date: 2016-11-22
     */
    fileprivate func invalidate() {
        guard let emptyView = objc_getAssociatedObject(base, &emptyViewKey) as? EmptyView else {
            return
        }
        delegate?.emptyWillDisAppear(in: base)
        emptyView.prepareForReuse()
        emptyView.removeFromSuperview()
        self.emptyView = nil
        delegate?.emptyDidDisAppear(in: base)
        base.isScrollEnabled = true
    }
    /**
     setup emptyView
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter itemsCount: itemsCount to decide whether emptyView will be added
     
     - returns: whether emptyView will be added
     */
    fileprivate func setupEmptyView(withItemsCount itemsCount: Int) -> Bool {
        guard let dataSource = dataSource, itemsCount == 0 else {
            invalidate()
            return false
        }
        if let shoudldDisplay = delegate?.emptyShouldDisplay(in: base), shoudldDisplay == false {
            invalidate()
            return false
        }
        guard let view = emptyView else {
            invalidate()
            return false
        }
        
        if let delegate = delegate {
            delegate.emptyWillAppear(in: base)
        }
        
        if view.superview == nil  {
            if base is UITableView && base is UICollectionView && base.subviews.count > 1 {
                base.insertSubview(view, at: 0)
            } else {
                base.addSubview(view)
            }
            view.translatesAutoresizingMaskIntoConstraints = false
            base.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: base, attribute: .left, multiplier: 1, constant: 0))
            base.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: base, attribute: .right, multiplier: 1, constant: 0))
            base.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: base, attribute: .top, multiplier: 1, constant: 0))
            base.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: base, attribute: .bottom, multiplier: 1, constant: 0))
            let inset = base.contentInset
            base.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: base, attribute: .width, multiplier: 1, constant: -inset.left - inset.right))
            base.addConstraint(NSLayoutConstraint(item: view, attribute: .height , relatedBy: .equal, toItem: base, attribute: .height, multiplier: 1, constant: -inset.top - inset.bottom))
            
        }
        view.prepareForReuse()
       
        if let customView = dataSource.customViewForEmpty(in: base) {
            // customView
            view.customView = customView
        } else {
            view.customView = nil
            // own
            view.titleLabel.attributedText = dataSource.titleForEmpty(in: base)
            view.detailLabel.attributedText = dataSource.descriptionForEmpty(in: base)
            let image = dataSource.imageForEmpty(in: base)
            view.imageView.image = image?.withRenderingMode(dataSource.imageTintColorForEmpty(in: base) == nil ? UIImageRenderingMode.alwaysOriginal : UIImageRenderingMode.alwaysTemplate)
            view.imageView.tintColor = dataSource.imageTintColorForEmpty(in: base)
            view.button.setImage(dataSource.buttonImageForEmpty(forState: .normal, in: base), for: .normal)
            view.button.setImage(dataSource.buttonImageForEmpty(forState: .highlighted, in: base), for: .highlighted)
            view.button.setImage(dataSource.buttonImageForEmpty(forState: .selected, in: base), for: .selected)
            view.button.setBackgroundImage(dataSource.buttonBackgroundImageForEmpty(forState: .normal, in: base), for: .normal)
            view.button.setBackgroundImage(dataSource.buttonBackgroundImageForEmpty(forState: .highlighted, in: base), for: .highlighted)
            view.button.setBackgroundImage(dataSource.buttonBackgroundImageForEmpty(forState: .selected, in: base), for: .selected)
            view.button.setAttributedTitle(dataSource.buttonTitleForEmpty(forState: .normal, in: base), for: .normal)
            view.button.setAttributedTitle(dataSource.buttonTitleForEmpty(forState: .highlighted, in: base), for: .highlighted)
            view.button.setAttributedTitle(dataSource.buttonTitleForEmpty(forState: .selected, in: base), for: .selected)
            view.button.backgroundColor = dataSource.buttonBackgroundColorForEmpty(in: base)
        }
        // common
        base.isScrollEnabled = delegate?.emptyShouldAllowScroll(in: base) ?? base.isScrollEnabled
        view.isUserInteractionEnabled = delegate?.emptyShouldAllowTouch(in: base) ?? true
        view.backgroundColor = dataSource.backgroundColorForEmpty(in: base)
        view.verticalSpace = dataSource.verticalSpaceForEmpty(in: base)
        view.verticalOffset = dataSource.verticalOffsetForEmpty(in: base)
        view.horizontalSpace = dataSource.horizontalSpaceForEmpty(in: base)
        view.minimumButtonWidth = dataSource.buttonMinimumWidthForEmpty(in: base)
        view.fadeInOnDisplay = delegate?.emptyShouldFadeIn(in: base) ?? true
        view.isHidden = false
        view.clipsToBounds = true
        view.autoInset = delegate?.emptyShouldAutoAddInsetWhenSuperviewIsScrollView(in: base) ?? true
        view.setupConstraints()
        // animation
        if let animateAllowed = delegate?.emptyShouldAnimateImageView(in: base), animateAllowed == true {
            if let animation = dataSource.imageAnimationForEmpty(in: base) {
                view.imageView.layer.add(animation, forKey: emptyImageViewAnimationKey)
            }
        } else if view.imageView.layer.animation(forKey: emptyImageViewAnimationKey) != nil {
            view.layer.removeAnimation(forKey: emptyImageViewAnimationKey)
        }
        delegate?.emptyDidAppear(in: base)
        return true
    }
    
}


















