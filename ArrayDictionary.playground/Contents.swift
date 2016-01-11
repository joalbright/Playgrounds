//: Playground - noun: a place where people can play

import Foundation

extension Array {
    
    func map<T>(var d: [String:T] = [:], @noescape transform: (Int,Array.Generator.Element) throws -> [String:T]) rethrows -> [String:T] {
        
        for (i,item) in self.enumerate() {
            
            try d += transform(i,item)
            
        }
        
        return d
        
    }
    
}

func += <T>(inout lhs: [String:T], rhs: [String:T]) -> [String:T] {
    
    for (k,v) in rhs { lhs[k] = v }; return lhs
    
}


let names = ["Jo","Jenna","Jake","Julie"]
let ages = [32,20,46,39]

let namesInfo1 = names.map { ["\($0)": $1] }
namesInfo1 // ["2": "Jake", "1": "Jenna", "0": "Jo", "3": "Julie"]

let namesInfo2 = names.map(["6":"Jim"]) { ["\($0)": $1] }
namesInfo2 // ["2": "Jake", "1": "Jenna", "0": "Jo", "6": "Jim", "3": "Julie"]

let namesInfo3 = names.map { [$1: ages[$0]] }
namesInfo3 // ["Jenna": 20, "Jo": 32, "Jake": 46, "Julie": 39]
