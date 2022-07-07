import UIKit

public class CollectionViewListLayout: UICollectionViewFlowLayout {
    
    public var itemHeight: CGFloat = 0
    
    public override func prepare() {
        defer { super.prepare() }
        guard let collectionView = collectionView else { return }
        self.itemSize = CGSize(width: collectionView.frame.width - sectionInset.left - sectionInset.right, height: itemHeight)
    }
}