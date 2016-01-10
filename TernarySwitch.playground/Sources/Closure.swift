//
//  Closure.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//


import Foundation

public func ??? <T: Comparable>(lhs: T, rhs: T -> Any) -> Any {
    
    return rhs(lhs)
    
}

public func ??? <T: RawRepresentable>(lhs: T, rhs: T -> Any) -> Any {
    
    return rhs(lhs)
    
}

