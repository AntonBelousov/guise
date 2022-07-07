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


public extension UITextField {
    var isEmpty: Bool {
        text == nil || text!.isEmpty
    }
}

public extension CGSize {
    static func intrinsicHeight(_ height: CGFloat) -> CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
}

public extension UIViewController {
    func presentFullscreen(_ vc: UIViewController) {
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

public class Tap: UIGestureRecognizer {
    var onTap = {}
    
    public convenience init(onTap: @escaping () -> ()) {
        self.init()
        self.onTap = onTap
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        onTap()
    }
}

public extension UIView {
    
    @discardableResult
    func onTap(_ block: @escaping () -> ()) -> UIGestureRecognizer {
        removeTap()
        isUserInteractionEnabled = true
        let tap = Tap(onTap: block)
        addGestureRecognizer(tap)
        return tap
    }
    
    func removeTap() {
        gestureRecognizers?.forEach {
            if $0 is Tap {
                removeGestureRecognizer($0)
            }
        }
    }
}

public extension UIButton {
    func onPress(target: Any, action: Selector) {
        addTarget(target, action: action, for: .touchUpInside)
    }
}

public class LabelWithInsets: UILabel {
    public var insets = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += insets.left + insets.right
        size.height += insets.top + insets.bottom
        return size
    }
}
