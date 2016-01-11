//: [Previous](@previous)

import Foundation

struct Person: Dictionit {
    
    var age: Int = 0
    var name: String?
    
    mutating func dict(d: [String:AnyObject]) {
        
        age <-- d["age"]
        name <-- d["name"]
        
    }
    
}

var her = Person {[
    
    "name" : "Jane",
    "age" : 35
    
]}

her.age
