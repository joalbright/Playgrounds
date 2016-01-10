//
//  Switchary.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//


import UIKit


public protocol SwitchInit { init() }

public func ??? <T: Comparable, R: SwitchInit>(lhs: T, rhs: (R.Type, (T, inout R) -> Void)) -> R {
    
    return rhs.0.init(lhs,rhs.1)
    
}

public func ??? <T: RawRepresentable, R: SwitchInit>(lhs: T, rhs: (R.Type, (T, inout R) -> Void)) -> R {
    
    return rhs.0.init(lhs,rhs.1)
    
}

public func ||| <L: SwitchInit, T, S>(lhs: L.Type, rhs: (T, inout S) -> Void) -> (L.Type, (T, inout S) -> Void) {
    
    return (lhs,rhs)
    
}

public extension SwitchInit {
    
    init<T>(_ a: T, @noescape _ b: (T, inout Self) -> Void) { self.init(); b(a,&self) }
    init<T: RawRepresentable>(_ a: T, @noescape _ b: (T, inout Self) -> Void) { self.init(); b(a,&self) }
    
}
