//: Playground - noun: a place where people can play


import UIKit


enum LifeStatus: Int { case Alive, Dead, Zombie }
enum AgeGroup: Int { case Baby, Toddler, Kid, Preteen, Teen, Adult }


////////////////////


let life: LifeStatus = .Dead

// embedded ternary operators … how I have built a ternary switch in past

let old = life == .Alive ? UIColor.greenColor()
        : life == .Dead ? UIColor.redColor()
        : life == .Zombie ? UIColor.grayColor()
        : UIColor.whiteColor()


// using custom operators

let v2 = life ??? .Alive --> UIColor.greenColor()
              ||| .Dead --> UIColor.redColor()
              ||| .Zombie --> UIColor.grayColor()
              *** UIColor.whiteColor()


let v3 = 100 ??? 10 --> UIColor.greenColor()
             ||| 20 --> UIColor.redColor()
             ||| 30 --> UIColor.grayColor()
             *** UIColor.magentaColor()


// works with ranges

let r1 = 21 ??? (0...3) --> AgeGroup.Baby
            ||| (4...12) --> AgeGroup.Kid
            ||| (13...19) --> AgeGroup.Teen
            *** AgeGroup.Adult


// works with closures

let c1 = life ??? {
    
    switch $0 {
    
    case .Alive: return UIColor.greenColor()
    case .Dead: return UIColor.redColor()
    case .Zombie: return UIColor.grayColor()
    
    }
    
}

let c2 = 12 ??? {
    
    switch $0 {
    
    case 0..<10: return UIColor.clearColor()
    case let x where x < 20: return UIColor.yellowColor()
    case let x where x < 30: return UIColor.orangeColor()
    case let x where x < 40: return UIColor.redColor()
    default: return UIColor.whiteColor()
    
    }
    
}

extension UIView: SwitchInit { }

let button1 = life ??? UIButton.self ||| {
    
    switch $0 {
        
    case .Alive : $1.setTitle("Eat Lunch", forState: .Normal)
    case .Dead : $1.setTitle("Eat Dirt", forState: .Normal)
    case .Zombie : $1.setTitle("Eat Brains", forState: .Normal)
        
    }
    
}

let button2 = UIButton (life) {
    
    switch $0 {
        
    case .Alive : $1.setTitle("Eat Lunch", forState: .Normal)
    case .Dead : $1.setTitle("Eat Dirt", forState: .Normal)
    case .Zombie : $1.setTitle("Eat Brains", forState: .Normal)
        
    }
    
}

button1.titleLabel?.text
button2.titleLabel?.text

