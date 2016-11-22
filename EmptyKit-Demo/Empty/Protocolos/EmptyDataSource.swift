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

    func imageForEmpty(in view: UIView) -> UIImage?
    func imageTintColorForEmpty(in view: UIView) -> UIColor?
    func imageAnimationForEmpty(in view: UIView) -> CAAnimation?
    
    func titleForEmpty(in view: UIView) -> NSAttributedString?
    func descriptionForEmpty(in view: UIView) -> NSAttributedString?
    
    func verticalOffsetForEmpty(in view: UIView) -> CGFloat
    func verticalSpaceForEmpty(in view: UIView) -> CGFloat
    func horizontalSpaceForEmpty(in view: UIView) -> CGFloat
    
    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString?
    func buttonImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage?
    func buttonBackgroundImageForEmpty(forState state: UIControlState, in view: UIView) -> UIImage?
    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor
    func buttonMinimumWidthForEmpty(in view: UIView) -> CGFloat?
    
    func backgroundColorForEmpty(in view: UIView) -> UIColor
    
    
    func customViewForEmpty(in view: UIView) -> UIView?
    
}

public extension EmptyDataSource {
    
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
        return 240
    }
    
    func customViewForEmpty(in view: UIView) -> UIView? {
        return nil
    }
    
}


















