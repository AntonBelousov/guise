//
//  ShadowContainer.swift
//  cleaner
//
//  Created by Anton Belousov on 23.05.2022.
//

import UIKit

open class ShadowedContainer: UIView {
    
    open var shadowColor: UIColor? {
        didSet { shadowView.layer.shadowColor = shadowColor?.cgColor }
    }
    open var shadowOffset = CGSize.zero {
        didSet { shadowView.layer.shadowOffset = shadowOffset }
    }
    open var shadowOpacity: Float = 1 {
        didSet { shadowView.layer.shadowOpacity = shadowOpacity }
    }
    
    open var shadowRadius: CGFloat = 0 {
        didSet { shadowView.layer.shadowRadius = shadowRadius }
    }
    
    open var cornerRadius: CGFloat = 0 {
        didSet {
            backgroundView.layer.cornerRadius = cornerRadius
            updateShadow()
        }
    }
    
    open override var backgroundColor: UIColor? {
        set { backgroundView.backgroundColor = newValue }
        get { backgroundView.backgroundColor }
    }
    
    open var shadowView = UIView()
    open var backgroundView = UIView()
    
    public convenience init() {
        self.init(frame: .zero)
        addSubview(shadowView)
        shadowView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(backgroundView)
        backgroundView.clipsToBounds = true
        backgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        // defer { shadowOpacity = 1 }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }
    
    open func updateShadow() {
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}
