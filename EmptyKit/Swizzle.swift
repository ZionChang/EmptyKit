//
//  Swizzle.swift
//  EmptyKit
//
//  Created by zhangzhi on 2017/9/28.
//  Copyright © 2017年 archerzz. All rights reserved.
//

import Foundation

protocol SelfAware: class {
    static func awake()
}

class NothingToSeeHere {
    
    static func harmlessFunction() {
        
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass?>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        for index in 0 ..< typeCount { (types[index] as? SelfAware.Type)?.awake() }
        types.deallocate(capacity: typeCount)
        
    }
    
}

extension UIApplication {
    
    private static let runOnce: Void = {
        NothingToSeeHere.harmlessFunction()
    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
    
}

extension UITableView: SelfAware {
    
    static func awake() {
        UITableView.swizzleIfNeeded
    }
    
}

extension UICollectionView: SelfAware {
    
    static func awake() {
        UICollectionView.swizzleIfNeeded
    }
    
}

