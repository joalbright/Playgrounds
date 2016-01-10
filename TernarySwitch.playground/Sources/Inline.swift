//
//  Inline.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//


import Foundation

// Simple Compare

public func ??? <T: Equatable>(lhs: T?, rhs: [(T,Any)]) -> Any? {
    
    guard let lhs = lhs else { return nil }
    for r in rhs { if lhs == r.0 { return r.1 } }; return nil
    
}

public func ??? <T: Equatable>(lhs: T, rhs: [(T,Any)]) -> Any? {
    
    for r in rhs { if lhs == r.0 { return r.1 } }; return nil
    
}

public func ??? <T: Equatable>(lhs: T, rhs: ([(T,Any)],Any)) -> Any {
    
    for r in rhs.0 { if lhs == r.0 { return r.1 } }; return rhs.1
    
}

// Range Compare

public func ??? <T: Comparable>(lhs: T, rhs: [(Range<T>,Any)]) -> Any? {
    
    for r in rhs { if lhs >= r.0.startIndex && lhs <= r.0.endIndex { return r.1 } }; return nil
    
}

public func ??? <T: Comparable>(lhs: T, rhs: ([(Range<T>,Any)],Any)) -> Any {
    
    for r in rhs.0 { if lhs >= r.0.startIndex && lhs <= r.0.endIndex { return r.1 } }; return rhs.1
    
}

// Simple Match


public func ||| <T>(lhs: (T,Any), rhs: (T,Any)) -> [(T,Any)] {
    
    return [lhs,rhs]
    
}

public func ||| <T>(lhs: [(T,Any)], rhs: (T,Any)) -> [(T,Any)] {
    
    return lhs + [rhs]
    
}

public func *** <T>(lhs: [(T,Any)], rhs: Any) -> ([(T,Any)],Any) {
    
    return (lhs,rhs)
    
}

public func *** <T>(lhs: (T,Any), rhs: Any) -> ([(T,Any)],Any) {
    
    return ([lhs],rhs)
    
}

// Range Match

public func ||| <T>(lhs: (Range<T>,Any), rhs: (Range<T>,Any)) -> [(Range<T>,Any)] {
    
    return [lhs] + [rhs]
    
}

public func ||| <T>(lhs: [(Range<T>,Any)], rhs: (Range<T>,Any)) -> [(Range<T>,Any)] {
    
    return lhs + [rhs]
    
}

public func ||| <T>(lhs: [(T,Any)], rhs: (Range<T>,Any)) -> [(T,Any)] {
    
    return lhs + rhs.0.map { ($0,rhs.1) }
    
}

public func *** <T>(lhs: (Range<T>,Any), rhs: Any) -> ([(Range<T>,Any)],Any) {
    
    return ([lhs],rhs)
    
}

// Pattern

public func --> <T>(lhs: T, rhs: Any) -> (T,Any) {
    
    return (lhs,rhs)
    
}


