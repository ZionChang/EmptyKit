//
//  EmptyDataSource.swift
//  EmptyKit
//
//  Created by archerzz on 16/11/15.
//  Copyright © 2016年 archerzz. All rights reserved.
//

import Foundation
import UIKit

/// EmptyDataSource
public protocol EmptyDataSource: class {
    /// default is nil
    func sectionsToIgnore(in view: UIView) -> [Int]?
    /// default is nil
    func imageForEmpty(in view: UIView) -> UIImage?
    /// default is nil
    func imageTintColorForEmpty(in view: UIView) -> UIColor?
    /// default is nil
    func imageAnimationForEmpty(in view: UIView) -> CAAnimation?
    /// default is nil
    func titleForEmpty(in view: UIView) -> NSAttributedString?
    /// default is nil
    func descriptionForEmpty(in view: UIView) -> NSAttributedString?
    /// default is 0
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat
    /// default is 10
    func verticalSpaceForEmpty(in view: UIView) -> CGFloat
    /// default is 20
    func horizontalSpaceForEmpty(in view: UIView) -> CGFloat
    /// default is nil
    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString?
    /// default is nil
    func buttonImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage?
    /// default is nil
    func buttonBackgroundImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage?
    /// default is nil
    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor
    /// default is 120
    func buttonMinimumWidthForEmpty(in view: UIView) -> CGFloat?
    /// default is clear
    func backgroundColorForEmpty(in view: UIView) -> UIColor
    /// default is nil
    func customViewForEmpty(in view: UIView) -> UIView?
    
}

// MARK: - Default imp
public extension EmptyDataSource {
    
    func sectionsToIgnore(in view: UIView) -> [Int]? {
        return nil
    }
    
    func imageForEmpty(in view: UIView) -> UIImage? {
        return nil
    }
    
    func imageTintColorForEmpty(in view: UIView) -> UIColor? {
        return nil
    }
    
    func imageAnimationForEmpty(in view: UIView) -> CAAnimation? {
        return nil
    }
    
    func titleForEmpty(in view: UIView) -> NSAttributedString? {
        return nil
    }
    
    func descriptionForEmpty(in view: UIView) -> NSAttributedString? {
        return nil
    }
    
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat {
        return 0
    }
    
    func verticalSpaceForEmpty(in view: UIView) -> CGFloat {
        return 10
    }
    
    func horizontalSpaceForEmpty(in view: UIView) -> CGFloat {
        return 20
    }
    
    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString? {
        return nil
    }
    
    func buttonImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage? {
        return nil
    }
    
    func buttonBackgroundImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage? {
        return nil
    }
    
    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.clear
    }
    
    func backgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.clear
    }
    
    func buttonMinimumWidthForEmpty(in view: UIView) -> CGFloat? {
        return 120
    }
    
    func customViewForEmpty(in view: UIView) -> UIView? {
        return nil
    }
    
}

// MARK: - UIViewController
public extension EmptyDataSource where Self: UIViewController {
    /// if navigationBarHidden is false return -64, or return 0
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat {
        if let nav = self.navigationController, !nav.isNavigationBarHidden {
            return -64
        }
        return 0
    }
    
}
// MARK: - UITableViewController
public extension EmptyDataSource where Self: UITableViewController {
    /// if navigationBarHidden is false return -64, or return 0（
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat {
        var offset: CGFloat = 0
        if let nav = self.navigationController, !nav.isNavigationBarHidden {
            offset -= 64
        }
        if let tableHeaderView = tableView.tableHeaderView, !tableHeaderView.isHidden {
            offset -= tableHeaderView.bounds.height / 2
        }
        return offset
    }
    
}















