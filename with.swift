
import Foundation

/**
 Object initialization helper
 
     let view = with(UIView()) {
         $0.backgroundColor = .red
     }
 
 equivalent to
 
     let view = UIView()
     view.backgroundColor = .red
 
 usefull for properties
 
     class Cell {
 
         // let, var or lazy var
         let title = with(UILabel()) {
             $0.text = "..."
             $0.textColor = .black
             ...
         }
     }
 */
public func with<T>(_ t: T, initBlock: (T) -> ()) -> T {
    initBlock(t)
    return t
}

public func with<T>(_ t: T, initBlock: () -> ()) -> T {
    return t
}