//
//  UIColor+hex.swift
//
//

import UIKit

public extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1) {
        
        var hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            print("UIColor.\(#function). A 6 character string is required")
            self.init(white: 0, alpha: 1)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}