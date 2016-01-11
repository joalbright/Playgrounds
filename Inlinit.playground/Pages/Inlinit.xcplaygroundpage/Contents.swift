import UIKit

struct Person: Inlinit {
    
    enum GenderType: String { case Male, Female }
    
    var age: Int = 0
    var gender: GenderType?
    var name: String?
    
}

var me = Person {
    
    $0.name = "Jo"
    $0.age = 32
    $0.gender = .Male
    
}

me <- {
    
    $0.age = 30
    $0.name = "John"
    
}

let you = Person(age: 32, gender: .Male, name: "JO")


me.age // 32
me.name

let randomIntArray = [Int] {
    
    for _ in 0...10 {
        
        $0.append(Int(arc4random_uniform(100)))
        
    }
    
}

randomIntArray

// randomIntArray.append(2) // fails cause it is a let

let personArray = [Person] {

    for _ in 0...8 {
        
        $0.append(Person {
            
            $0.age = Int(arc4random_uniform(100))
            $0.gender = Int(arc4random_uniform(100)) % 2 == 0 ? .Male : .Female // comment this line out to see error
            
        })
        
    }

}

personArray

extension UIView: Inlinit { }

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UILabel {
            
            $0.text = "This is Awesome!"
            $0.textColor = UIColor.cyanColor()
            $0.frame = CGRect(x: 20, y: 20, width: view.frame.width - 40, height: 40)
            view.addSubview($0)
            
        }
        
        view.addSubview(UIButton {
            
            $0.setTitle("Submit", forState: .Normal)
            $0.frame = CGRect(x: 20, y: 60, width: view.frame.width - 40, height: 40)
            
        })
        
        
    }
    
}

let vc = ViewController()

vc.loadViewIfNeeded()

vc.view.subviews






