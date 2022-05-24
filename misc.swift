import Foundation
import UIKit

public extension FileManager {
    
    var docs: URL {
        let paths = urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    func sharedDir(groupId: String) -> URL? {
        containerURL(forSecurityApplicationGroupIdentifier: groupId)
    }
    
    func sharedFileURL(filename: String, groupId: String) -> URL? {
        sharedDir(groupId: groupId)?.appendingPathComponent(filename)
    }
}


public extension NSAttributedString {
    func appending(string: NSAttributedString) -> NSAttributedString {
        let mstr = NSMutableAttributedString(attributedString: self)
        mstr.append(string)
        return mstr
    }
    
    func appending(string: String, attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        return appending(string: NSAttributedString(string: string, attributes: attributes))
    }
}

public extension UIView {
    @discardableResult
    func forAutolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

public extension UIStackView {
    func setCustomSpacingAfterLast(_ spacing: CGFloat) {
        if arrangedSubviews.count > 0 {
            setCustomSpacing(spacing, after: arrangedSubviews.last!)
        }
    }
}

public protocol Initializable {}

public extension Initializable {
    func with(block: (Self) -> ()) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Initializable {}
