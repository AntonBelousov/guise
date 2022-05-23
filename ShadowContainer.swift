//
//  ShadowContainer.swift
//  cleaner
//
//  Created by Anton Belousov on 23.05.2022.
//

import UIKit

public class ShadowedContainer: UIView {
    
    public var shadowColor: UIColor? {
        didSet { shadowView.layer.shadowColor = shadowColor?.cgColor }
    }
    public var shadowOffset = CGSize.zero {
        didSet { shadowView.layer.shadowOffset = shadowOffset }
    }
    public var shadowOpacity: Float = 1 {
        didSet { shadowView.layer.shadowOpacity = shadowOpacity }
    }
    
    public var shadowRadius: CGFloat = 0 {
        didSet { shadowView.layer.shadowRadius = shadowRadius }
    }
    
    public var cornerRadius: CGFloat = 0 {
        didSet {
            backgroundView.layer.cornerRadius = cornerRadius
            updateShadow()
        }
    }
    
    public override var backgroundColor: UIColor? {
        set { backgroundView.backgroundColor = newValue }
        get { backgroundView.backgroundColor }
    }
    
    public var shadowView = UIView()
    public var backgroundView = UIView()
    
    public convenience init() {
        self.init(frame: .zero)
        addSubview(shadowView)
        shadowView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(backgroundView)
        backgroundView.clipsToBounds = true
        backgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        defer { shadowOpacity = 1 }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }
    
    func updateShadow() {
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}
