
import UIKit

infix operator ✕ { associativity left precedence 100 }

public func ✕ <T: Any>(lhs: Int, rhs: T) -> [T] {
    
    return [T](count: lhs, repeatedValue: rhs)
    
}

public func ✕ <T: Any>(lhs: Int, rhs: T.Type) -> [T?] {
    
    return [T?](count: lhs, repeatedValue: nil)
    
}

public class MatrixView: UIView {
    
    public var p: CGFloat = 10
    
    public override func drawRect(rect: CGRect) {
        
        let c = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(c, .Round)
        CGContextSetLineJoin(c, .Round)
        CGContextSetLineWidth(c, 2)
        
        CGContextMoveToPoint(c, p * 2, p)
        CGContextAddLineToPoint(c, p, p)
        CGContextAddLineToPoint(c, p, rect.height - p)
        CGContextAddLineToPoint(c, p * 2, rect.height - p)
        
        CGContextMoveToPoint(c, rect.width - p * 2, p)
        CGContextAddLineToPoint(c, rect.width - p, p)
        CGContextAddLineToPoint(c, rect.width - p, rect.height - p)
        CGContextAddLineToPoint(c, rect.width - p * 2, rect.height - p)
        
        CGContextStrokePath(c)
        
    }
    
}