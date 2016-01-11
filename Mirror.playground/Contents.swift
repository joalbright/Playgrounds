//: Playground - noun: a place where people can play

import UIKit

struct Person {
    
    var age: Int = 0
    var name: String?
    
}

let me = Person(age: 30, name: "Jo")

let m = Mirror(reflecting: me)

for child in m.children {
    
    
    
}