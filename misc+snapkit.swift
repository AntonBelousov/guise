import Foundation
import UIKit
import SnapKit

public extension UIView {
    func addSubview(_ view: UIView, constraints: (ConstraintMaker) -> ()) {
        addSubview(view)
        view.snp.makeConstraints(constraints)
    }
}

public extension UIStackView {
    func addArrangedSubview(_ view: UIView, constraints: (ConstraintMaker) -> ()) {
        addArrangedSubview(view)
        view.snp.makeConstraints(constraints)
    }
}