import UIKit

public extension UIResponder {
    @available(iOSApplicationExtension, unavailable)
    @objc func closeKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}