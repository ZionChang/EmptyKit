//
//  EmptyDelegate.swift
//  EmptyKit-Swift
//
//  Created by archerzz on 16/11/18.
//  Copyright © 2016年 archerzz. All rights reserved.
//

import Foundation
import UIKit

/// EmptyDelegate
public protocol EmptyDelegate: class {
    /**
     Asks the delegate to know if the empty dataset should fade in when displayed. Default is true.
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     
     - returns: true if the empty should fade in
     */
    func emptyShouldFadeIn(in view: UIView) -> Bool
    /**
     Asks the delegate to know if the empty dataset should display. Default is true.
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     
     - returns: true if the empty should display
     */
    func emptyShouldDisplay(in view: UIView) -> Bool
    /**
     Asks the delegate to know if the empty dataset should allow touch in when displayed. Default is true.
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     
     - returns: true if the empty should allow touch
     */
    func emptyShouldAllowTouch(in view: UIView) -> Bool
    
    
    /// Asks the delegate to know if the empty dataset should enble tap gesture whick is added to emtpyView . Default is ture
    ///
    /// - Parameter view: empty view's superview
    /// - Returns: true if the empty enable tap
    func emptyShouldEnableTapGesture(in view: UIView) -> Bool
    
    /**
     Asks the delegate to know if the empty dataset should allow scroll in when displayed. Default is true.
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     
     - returns: true if the empty should allow scroll
     */
    func emptyShouldAllowScroll(in view: UIView) -> Bool
    /**
     Asks the delegate to know if the empty dataset should animate imageview when displayed. Default is true.
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     
     - returns: true if the empty should animate imageview
     */
    func emptyShouldAnimateImageView(in view: UIView) -> Bool
    /**
     Tell the delegate button has been tapped in empty
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter button: tapped button
     - parameter view:   empty view's superview
     */
    func emptyButton(_ button: UIButton, tappedIn view: UIView)
    /**
     Tell the delegate emptyView has been tapped in empty
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter emptyView: emptyView which is displayed
     - parameter view:      empty view's superview
     */
    func emptyView(_ emptyView: UIView, tappedIn view: UIView)
    /**
     Tell the delegate to know emptyView will appear
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     */
    func emptyWillAppear(in view: UIView)
    /**
     Tell the delegate to know emptyView did appear
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     */
    func emptyDidAppear(in view: UIView)
    /**
     Tell the delegate to know emptyView will disappear
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     */
    func emptyWillDisAppear(in view: UIView)
    /**
     Tell the delegate to know emptyView did disappear
     
     - author: archerzz
     - date: 2016-11-22
     
     - parameter view: empty view's superview
     */
    func emptyDidDisAppear(in view: UIView)
    
    /// 是否允许自动增加Inset来调整位置（默认true)
    func emptyShouldAutoAddInsetWhenSuperviewIsScrollView(in view: UIView) -> Bool

    
}

// MARK: - Default
public extension EmptyDelegate {
    
    func emptyShouldFadeIn(in view: UIView) -> Bool {
        return true
    }
    
    func emptyShouldDisplay(in view: UIView) -> Bool {
        return true
    }
    
    func emptyShouldAllowTouch(in view: UIView) -> Bool {
        return true
    }
    
    func emptyShouldEnableTapGesture(in view: UIView) -> Bool {
        return true
    }
    
    func emptyShouldAllowScroll(in view: UIView) -> Bool {
        return true
    }
    
    func emptyShouldAnimateImageView(in view: UIView) -> Bool {
        return true
    }
    
    func emptyButton(_ button: UIButton, tappedIn view: UIView) {
    }
    
    func emptyView(_ emptyView: UIView, tappedIn view: UIView) {
    }
    
    func emptyWillAppear(in view: UIView) {
    }
    
    func emptyDidAppear(in view: UIView) {
    }
    
    func emptyWillDisAppear(in view: UIView) {
    }
    
    func emptyDidDisAppear(in view: UIView) {
    }
    
    /// 是否允许自动增加Inset来调整位置（默认true)
    func emptyShouldAutoAddInsetWhenSuperviewIsScrollView(in view: UIView) -> Bool {
        return true
    }
    
}
