//: [Previous](@previous)

import Foundation

enum GenderType: String { case Male, Female }

struct Person: Dictionit {
    
    var age: Int = 0
    var gender: GenderType?
    var name: String?
    
    mutating func dict(d: [String:AnyObject]) {
        
        age = d["age"] as? Int ?? 0
        gender = GenderType(rawValue: d["gender"] as? String ?? "Male")
        name = d["name"] as? String
        
    }
    
}

var her = Person {[
    
    "name" : "Jane",
    "age" : 35,
    "gender" : GenderType.Female.rawValue
    
]}

her.age
