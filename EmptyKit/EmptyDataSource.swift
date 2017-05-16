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
    /**
     Ask the datasource for the sections you want to ignore. Default is nil.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: The sections you want to ignore.
     */
    func sectionsToIgnore(in view: UIView) -> [Int]?
    /**
     Ask the datasource for an image you want to display. Default is nil.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: An image you want to display.
     */
    func imageForEmpty(in view: UIView) -> UIImage?
    /**
     Ask the datasource for a tint color that you want to rendering the image. Default is nil, and the redering mode of image is alwaysOriginals.
     If you specific a color, the redering mode of image is alwaysTemplate.
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A tint color that you want to rendering the image.
     */
    func imageTintColorForEmpty(in view: UIView) -> UIColor?
    /**
     Ask the datasource for an animation you want to add to image's layer. Default is nil.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: An animation you want to add to image's layer.
     */
    func imageAnimationForEmpty(in view: UIView) -> CAAnimation?
    /**
     Ask the datasource for a title you want to display. Default is nil.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A title you want to display.
     */
    func titleForEmpty(in view: UIView) -> NSAttributedString?
    /**
     Ask the datasource for a description you want to display. Default is nil.
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A description you want to display.
     */
    func descriptionForEmpty(in view: UIView) -> NSAttributedString?
    /**
     Ask the datasource for a vertical offset you want to set up to align the content. Default is 0.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A vertical offset you want to set up to align the content.
     */
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat
    /**
     Ask the datasource for a vertical space between elements. Default is 10 pts.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A vertical space.
     */
    func verticalSpaceForEmpty(in view: UIView) -> CGFloat
    /**
     Ask the datasource for a horizontal space for the leading and trailing. Default is 20 pts.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: A horizontal space for the leading and trailing
     */
    func horizontalSpaceForEmpty(in view: UIView) -> CGFloat
    /**
     Ask the datasource for a title you want to display in the different state of button. Default is nil
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: A title you want to display in the different state of button
     */
    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString?
    /**
     Ask the datasource for a image you want to display in the different state of button. Default is nil
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: A image you want to display in the different state of button
     */
    func buttonImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage?
    /**
     Ask the datasource for a background image you want to display in the different state of button. Default is nil
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: A background image you want to display in the different state of button
     */
    func buttonBackgroundImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage?
    /**
     Ask the datasource for a background color you want to display in the different state of button. Default is clear
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: A background color you want to display in the different state of button
     */
    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor
    /**
     Ask the datasource for a minimum width of the button. Default is 120 pts.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A minimum width of the button.
     */
    func buttonMinimumWidthForEmpty(in view: UIView) -> CGFloat?
    /**
     Ask the datasource for a background color of the empty view. Default is clear.
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview.
     
     - returns: A background color of the empty view.
     */
    func backgroundColorForEmpty(in view: UIView) -> UIColor
    /**
     Ask the datasource for a custom view you want to display in empty view.. Default is nil
     
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: A custom view you want to display in empty view.
     */
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
    /**
     offset will be -navHeight
     ```
     if let nav = self.navigationController, !nav.isNavigationBarHidden, nav.navigationBar.isTranslucent {
        return -nav.navigationBar.bounds.height
     }
     return 0
     ```
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: the opposite number of the navigationbar height if isNavigationBarHidden is false and navigationBar.isTranslucent is true, otherwise return 0.
     */
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat {
        if let nav = self.navigationController, !nav.isNavigationBarHidden, nav.navigationBar.isTranslucent {
            return -nav.navigationBar.frame.maxY / 2
        }
        return 0
    }
    
}
// MARK: - UITableViewController
public extension EmptyDataSource where Self: UITableViewController {
    /**
     offset will be -(navHeight + tableHeaderViewHeight)
     ```
     var offset: CGFloat = 0
     if let nav = self.navigationController, !nav.isNavigationBarHidden, nav.navigationBar.isTranslucent {
        offset -= nav.navigationBar.bounds.height
     }
     if let tableHeaderView = tableView.tableHeaderView, !tableHeaderView.isHidden {
        offset -= tableHeaderView.bounds.height / 2
     }
     return offset
     ```
     - author: archerzz
     - date: 2016-11-23
     
     - parameter view: Empty view's superview
     
     - returns: the opposite number of the navigationbar height if isNavigationBarHidden is false and navigationBar.isTranslucent is true plus the half of the tableHeaderView's height, otherwise return 0.
     */
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat {
        var offset: CGFloat = 0
        if let nav = self.navigationController, !nav.isNavigationBarHidden, nav.navigationBar.isTranslucent {
            offset -= nav.navigationBar.frame.maxY / 2
        }
        if let tableHeaderView = tableView.tableHeaderView, !tableHeaderView.isHidden {
            return 0
        }
        return offset
    }
    
}


















