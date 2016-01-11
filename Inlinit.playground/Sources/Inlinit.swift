//
//  Inlinit.swift
//  Inlinit
//
//  Created by Jo Albright on 01/06/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//

import Foundation

public protocol Inlinit { init() }

public extension Inlinit {
    
    init(@noescape c: inout Self -> ()) { self.init(); c(&self) }
    
}

infix operator <- { }

public func <- <T:Inlinit>(inout lhs: T, rhs: inout T -> ()) {
    
    rhs(&lhs)
    
}


public protocol Dictionit { init(); mutating func dict(d: [String:AnyObject]) }

public extension Dictionit {
    
    init(@noescape c: () -> [String:AnyObject]) { self.init(); dict(c())  }
    
}

// MARK: Extensions

extension Array: Inlinit { }
extension Dictionary: Inlinit { }
extension Set: Inlinit { }
