//
//  GradientView.swift
//

import UIKit

public struct LinearGradient {
    public init(startPoint: CGPoint = CGPoint.zero, endPoint: CGPoint = CGPoint.zero, startColor: UIColor = UIColor.clear, endColor: UIColor = UIColor.clear) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.startColor = startColor
        self.endColor = endColor
    }
    
    public var startPoint  = CGPoint.zero
    public var endPoint    = CGPoint.zero
    public var startColor  = UIColor.clear
    public var endColor    = UIColor.clear
}

open class GradientView: UIView {
    public convenience init() {
        self.init(frame: .zero)
    }
    open override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    open var gradient: LinearGradient? {
        didSet {
            
            guard let layer = self.layer as? CAGradientLayer else {
                return
            }
            
            guard let gradient = gradient else {
                layer.colors = nil
                return
            }
            
            layer.startPoint = gradient.startPoint
            layer.endPoint = gradient.endPoint
            layer.colors = [gradient.startColor.cgColor, gradient.endColor.cgColor]
        }
    }
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
}

public extension CGPoint {
    static var top = CGPoint(x: 0.5, y: 0)
    static var topLeft = CGPoint(x: 0, y: 0)
    static var topRight = CGPoint(x: 1, y: 0)
    static var center = CGPoint(x: 0.5, y: 0.5)
    static var centerLeft = CGPoint(x: 0, y: 0.5)
    static var centerRight = CGPoint(x: 1, y: 0.5)
    static var bottomLeft = CGPoint(x: 0, y: 1)
    static var bottom = CGPoint(x: 0.5, y: 1)
    static var bottomRight = CGPoint(x: 1, y: 1)
}