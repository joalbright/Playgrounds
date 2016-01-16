//: [Previous](@previous) | [Next](@next)

import Foundation


let l: [Int] = []
let m = 3
let n = 3

// let a:[Int] = for x in l { yield x * 2 }
// map is better for this one

let a = l.map { $0 * 2 }


// let b:[(Int,Int)] = for row in 0..<m { for col in 0..<n { yield (row,col) } }

let b = [(Int,Int)] {
    
    for r in 0..<m { for c in 0..<n { $0.append((r,c)) } }
    
}

b

// let c:[(Int,Int)] = for row in 0..<m { for col in 0..<n where row+col < 5 { yield (row,col) } }

let c = [(Int,Int)] {
    
    for r in 0..<m { for c in 0..<n where r + c < 2 { $0.append((r,c)) } }
    
}

c