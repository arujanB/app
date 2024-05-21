import UIKit

final class ProductCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCategoryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
