import UIKit

final class MainTableViewCell: UITableViewCell {
    static let identifire = "MainTableViewCell"
    var callBack: (() -> Void)?
    
    private lazy var categoryCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ProductCategoryCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private let moveButton = UIButton().apply {
        $0.setTitle("move", for: .normal)
        $0.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
        $0.tintColor = .blue
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func clickMe() {
        print("MAIN VC")
        callBack?()
    }
    
    func configure(model: MainModel) {
        moveButton.setTitle(model.name, for: .normal)
    }
}

extension MainTableViewCell {
    func setupViews() {
        contentView.addSubview(moveButton)
    }
    
    func setupConstraints() {
        moveButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

