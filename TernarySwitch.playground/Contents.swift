//: Playground - noun: a place where people can play

import UIKit

// ??? loops array and returns first element where lhs == element.0
infix operator ??? { associativity left precedence 200 }

// || merges values into an array
infix operator || { associativity left precedence 210 }

// --> convert lhs & rhs to tuple (lhs,rhs)
infix operator --> { associativity left precedence 220 }

func ??? <T: Equatable>(lhs: T?, rhs: [(T,AnyObject)]) -> AnyObject? {
    
    for r in rhs { if lhs == r.0 { return r.1 } }; return nil
    
}

func ??? <T: Equatable>(lhs: T, rhs: [(T,AnyObject)]) -> AnyObject? {
    
    for r in rhs { if lhs == r.0 { return r.1 } }; return nil

}

func || <T>(lhs: (T,AnyObject), rhs: (T,AnyObject)) -> [(T,AnyObject)] {
    
    return [lhs,rhs]

}

func || <T>(lhs: [(T,AnyObject)], rhs: (T,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs + [rhs]

}

func || <T>(lhs: (Range<T>,AnyObject), rhs: (Range<T>,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs.0.map { ($0,lhs.1) } + rhs.0.map { ($0,rhs.1) }
    
}

func || <T>(lhs: (Range<T>,AnyObject), rhs: (T,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs.0.map { ($0,lhs.1) } + [rhs]

}

func || <T>(lhs: [(T,AnyObject)], rhs: (Range<T>,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs + rhs.0.map { ($0,rhs.1) }

}

func --> <T>(lhs: T, rhs: AnyObject) -> (T,AnyObject) {
    
    return (lhs,rhs)

}

enum LifeStatus { case Alive, Dead, Zombie }

let life: LifeStatus? = .Dead

// embedded ternary operators … how I have built a ternary switch in past
let color1 = life == .Alive ? UIColor.greenColor() : life == .Dead ? UIColor.redColor() : life == .Zombie ? UIColor.grayColor() : UIColor.whiteColor()

// using custom operators
let color2 = life ??? .Alive --> UIColor.greenColor() || .Dead --> UIColor.redColor() || .Zombie --> UIColor.grayColor() ?? UIColor.whiteColor()

let age = 15

// works with ranges
//let ageGroup = age ??? (0...1) --> "baby" || (2...4) --> "toddler" || (5...12) --> "kid" || (13...19) --> "teen" ?? "adult"
//
//ageGroup

//func ??? <T:Comparable>(lhs: T, rhs: T -> AnyObject) -> AnyObject { return rhs(lhs) }
func ??? <T:Comparable>(lhs: T, rhs: T -> AnyObject?) -> AnyObject? { return rhs(lhs) }

let color = 12 ??? {
    
    switch $0 {
        
    case 0..<10: return UIColor.clearColor()
    case let x where x < 20: return UIColor.yellowColor()
    case let x where x < 30: return UIColor.orangeColor()
    case let x where x < 40: return UIColor.redColor()
    default: return UIColor.whiteColor()
        
    }
    
}

color
