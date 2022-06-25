import Foundation
import UIKit
import SnapKit

public extension UIView {
    func addSubview(_ view: UIView, constraints: (ConstraintMaker) -> ()) {
        addSubview(view)
        view.snp.makeConstraints(constraints)
    }
}

public extension UIView {
    func addSubview(_ view: UIView, constraints: (ConstraintMaker, UIView) -> ()) {
        addSubview(view)
        view.snp.makeConstraints { make in
            constraints(make, self)
        }
    }
}