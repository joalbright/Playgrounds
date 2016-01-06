//: Playground - noun: a place where people can play

import UIKit

typealias AlcoholLevel = Double


enum Drinks { case Beer, Wine, Shot }
enum JailState { case Arrested, Free, Bail }

struct Person {
    
    var alcohol: AlcoholLevel = 0
    var jail: JailState = .Free
    
    mutating func drink(d: Drinks) {
        
        switch d {
            
        case .Beer : alcohol += 0.005
        case .Wine : alcohol += 0.007
        case .Shot : alcohol += 0.01
            
        }
        
    }
    
    mutating func pullOver(e: AlcoholLevel -> JailState) -> JailState {
    
        jail = e(alcohol)
        return jail
    
    }
    
}

func breathalizer(a: AlcoholLevel) -> JailState {
    
    return a > 0.08 ? .Arrested : .Free
    
}


var me = Person()

for _ in 0...10 { me.drink(.Shot) }

me.alcohol

me.pullOver(breathalizer)



