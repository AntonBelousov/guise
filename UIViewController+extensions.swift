import UIKit

extension UIViewController {
    
    public func setBackButtonTitle(_ title: String) {
        let nvc = self.navigationController
        let currentViewControllerIndex = nvc?.viewControllers.firstIndex(of: self) ?? 0
        
        if currentViewControllerIndex > 0 {
            let previousViewController = self.navigationController!.viewControllers[currentViewControllerIndex - 1]
            previousViewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: title,
                                                                                      style: .plain,
                                                                                      target: nil,
                                                                                      action: nil)
        }
    }
    
    func addChildOverlay(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.view.frame = view.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child.didMove(toParent: self)
    }
    
    func addChild(_ child: UIViewController, into view: UIView) {
        addChild(child)
        if let view = view as? UIStackView {
            view.addArrangedSubview(child.view)
        } else {
            view.addSubview(child.view)
        }
        child.didMove(toParent: self)
    }
    
    func removeFromContainer() {
        willMove(toParent: nil)
        if let parent = view.superview as? UIStackView {
            parent.removeArrangedSubview(view)
        }
        view.removeFromSuperview()
        removeFromParent()
    }
    
    func alert(title: String? = nil, message: String? = nil, overOldAlert: Bool = true) {
        
        if !overOldAlert, presentedViewController is UIAlertController {
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}