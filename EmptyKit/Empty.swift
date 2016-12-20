//
//  Empty.swift
//  EmptyKit-Swift
//
//  Created by archerzz on 16/11/16.
//  Copyright © 2016年 archerzz. All rights reserved.
//

import Foundation
import UIKit
/// Empty
public final class Empty<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/**
A type that has Empty extensions.
*/
public protocol EmptyCompatible {
    associatedtype CompatibleType
    var ept: CompatibleType { get }
}

// MARK: - EmptyCompatible
public extension EmptyCompatible {
    public var ept: Empty<Self> {
        get { return Empty(self) }
    }
}

// MARK: - UIScrollView EmptyCompatible
extension UIScrollView: EmptyCompatible {}

