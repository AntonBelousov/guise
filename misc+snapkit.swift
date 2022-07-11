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

public extension UIStackView {
    func addArrangedSubview(_ view: UIView, constraints: (ConstraintMaker) -> ()) {
        addArrangedSubview(view)
        view.snp.makeConstraints(constraints)
    }
}

public class ScrollStackView: UIView {
    public var scrollView = UIScrollView()
    public var stackView = UIStackView()
    
    public convenience init() {
        self.init(hInsets: 0)
    }
    
    public convenience init(hInsets: CGFloat) {
        self.init(frame: .zero)
        stackView.axis = .vertical
        scrollView.keyboardDismissMode = .onDrag
        addSubview(scrollView.with {
            $0.addSubview(stackView) {
                $0.top.bottom.equalToSuperview()
                $0.leading.trailing.equalToSuperview().inset(hInsets)
                $0.width.equalToSuperview().inset(hInsets)
            }
        }) {
            $0.edges.equalToSuperview()
        }
    }
}

public class AspectRatioImageView: UIImageView {
    
    public override var image: UIImage? {
        didSet {
            guard let image = image else {
                snp.removeConstraints()
                return
            }
            snp.remakeConstraints {
                $0.height.equalTo(snp.width).multipliedBy(image.size.height/image.size.width)
            }
        }
    }
}