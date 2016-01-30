//: Playground - noun: a place where people can play

import UIKit

var names = 4 ✕ String.self

names[1] = "Jo"

names


struct Grid {
    
    var content: [[Any]]
    
    init(_ content: [[Any]]) {
        
        self.content = content
        
    }
    
    func checker(rect: CGRect) -> UIView {
        
        let view = UIView(frame: rect)
        
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        let w = rect.width / content.count
        let h = rect.height / content[0].count
        
        for (c,col) in content.enumerate() {
            
            for (r,item) in col.enumerate() {
                
                let label = UILabel(frame: CGRect(x: c * w, y: r * h, width: w, height: h))
                
                label.backgroundColor = (c + r) % 2 == 0 ? UIColor.whiteColor() : UIColor.blackColor()
                label.textColor = (c + r) % 2 == 0 ? UIColor.blackColor() : UIColor.whiteColor()
                
                label.text = "\(item)"
                label.textAlignment = .Center
                label.font = UIFont(name: "HelveticaNeue-Thin", size: (w + h) / 2 - 10)
                
                view.addSubview(label)
                
            }
            
        }
        
        return view
        
    }
    
    func matrix(rect: CGRect) -> UIView {
        
        let view = MatrixView(frame: rect)
        
        view.p = 15
        view.backgroundColor = UIColor.whiteColor()
        
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        let p = 20
        let w = (rect.width - p * 2) / content.count
        let h = (rect.height - p * 2) / content[0].count
        
        for (c,col) in content.enumerate() {
            
            for (r,item) in col.enumerate() {
                
                let label = UILabel(frame: CGRect(x: c * w + p, y: r * h + p, width: w, height: h))
                
                label.text = "\(item)"
                label.textAlignment = .Center
                label.font = UIFont(name: "HelveticaNeue-Thin", size: (w + h) / 2 - 10)
                
                view.addSubview(label)
                
            }
            
        }
        
        return view
        
    }
    
    subscript ( c: Int, r: Int) -> Any {
        
        get { return content[c][r] }
        set { content[c][r] = newValue }
        
    }
    
    subscript ( c: Int) -> [Any] {
        
        get { return content[c] }
        set { content[c] = newValue }
        
    }
    
}




var g = Grid(3 ✕ (3 ✕ 0))

g[0,2] = 1
g[0,0] = 3
g[1,1] = 2
g[2,2] = 1
g[2,0] = 1

g.content

let v1 = g.matrix(CGRect(x: 0, y: 0, width: 200, height: 200))




typealias Square = (c: Int, r: Int)
typealias Piece = String

extension Grid {
    
    func move(pieceAt s1: Square, toSquare s2: Square) -> Piece? {
        
        let piece1 = g[s1.0,s1.1]
        let piece2 = g[s2.0,s2.1]
        
        g[s2.0,s2.1] = piece1
        g[s1.0,s1.1] = ""
        
        return piece2 as? Piece
        
    }
    
}


g = Grid(8 ✕ (8 ✕ ""))

g[0] = ["♜","♞","♝","♛","♚","♝","♞","♜"]
g[1] = 8 ✕ "♟"
g[6] = 8 ✕ "♟"
g[7] = ["♜","♞","♝","♛","♚","♝","♞","♜"]

let v2 = g.checker(CGRect(x: 0, y: 0, width: 200, height: 200))

g.move(pieceAt: (1,1), toSquare: (3,1))
g.checker(CGRect(x: 0, y: 0, width: 200, height: 200))


g.move(pieceAt: (6,4), toSquare: (5,4))
g.checker(CGRect(x: 0, y: 0, width: 200, height: 200))




