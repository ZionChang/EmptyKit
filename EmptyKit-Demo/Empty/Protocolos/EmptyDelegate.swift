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
    func emptyShouldFadeIn(in view: UIView) -> Bool
    func emptyShouldDisplay(in view: UIView) -> Bool
    func emptyShouldAllowTouch(in view: UIView) -> Bool
    func emptyShouldAllowScroll(in view: UIView) -> Bool
    func emptyShouldAnimateImageView(in view: UIView) -> Bool
    func emptyButton(_ button: UIButton, didTappedIn view: UIView)
    func emptyView(_ emptyView: UIView, didTapppedIn view: UIView)
    func emptyDidAppear(in view: UIView)
    func emptyWillDisAppear(in view: UIView)
    func emptyDidDisAppear(in view: UIView)
    func emptyWillAppear(in view: UIView)
}

// MARK: - Default
public extension EmptyDelegate {
    
    func emptyShouldFadeIn(in view: UIView) -> Bool {
        print("archerzz: ", #function, #line, type(of: self))
        return false
    }
    
    func emptyShouldDisplay(in view: UIView) -> Bool {
        print("archerzz: ", #function, #line, type(of: self))
        return true
    }
    
    func emptyShouldAllowTouch(in view: UIView) -> Bool {
        print("archerzz: ", #function, #line, type(of: self))
        return true
    }
    
    func emptyShouldAllowScroll(in view: UIView) -> Bool {
        print("archerzz: ", #function, #line, type(of: self))
        return true
    }
    
    func emptyShouldAnimateImageView(in view: UIView) -> Bool {
        print("archerzz: ", #function, #line, type(of: self))
        return true
    }
    
    func emptyButton(_ button: UIButton, didTappedIn view: UIView) {
        print("archerzz: ", #function, #line, type(of: self))
    }
    
    func emptyView(_ emptyView: UIView, didTapppedIn view: UIView) {
        print("archerzz: ", #function, #line, type(of: self))
    }
    
    func emptyWillAppear(in view: UIView) {
        print("archerzz: ", #function, #line, type(of: self))
    }
    
    func emptyDidAppear(in view: UIView) {
        print("archerzz: ", #function, #line, type(of: self))
    }
    
    func emptyWillDisAppear(in view: UIView) {
        print("archerzz: ", #function, #line, type(of: self))
    }
    
    func emptyDidDisAppear(in view: UIView) {
        print("archerzz: ", #function, #line, type(of: self))
    }
    
}
