//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

protocol ExcutableQueue {
    
    var queue: dispatch_queue_t { get }
    
}

extension ExcutableQueue {
    
    func execute(closure: () -> Void) { dispatch_async(queue, closure) }
    
}

enum Queue: ExcutableQueue {
    
    case Main
    case UserInteractive
    case UserInitiated
    case Utility
    case Background
    
    var queue: dispatch_queue_t {
        
        switch self {
            
        case .Main: return dispatch_get_main_queue()
        case .UserInteractive: return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
        case .UserInitiated: return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        case .Utility: return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
        case .Background: return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
            
        }
        
    }
    
}

enum SerialQueue: String, ExcutableQueue {
    
    case GetPost = "SerialQueue.GetPost"
    case PutPost = "SerialQueue.PutPost"
    
    var queue: dispatch_queue_t { return dispatch_queue_create(rawValue, DISPATCH_QUEUE_SERIAL) }
    
}

Queue.Background.execute {
    
    let url = NSURL(string: "https://itunes.apple.com/search?term=Daft+Punk&entity=album&limit=20")!
    let data = NSData(contentsOfURL: url)!
    let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    
    print(url)
    
    Queue.Main.execute {
    
        print(json)
        
    }
    
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
