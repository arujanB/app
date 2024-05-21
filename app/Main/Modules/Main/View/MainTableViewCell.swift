import UIKit

final class MainTableViewCell: UITableViewCell {
    static let identifire = "MainTableViewCell"
    let defaults = UserDefaults.standard
    private var clickCount = 0
    private var isLikeBool: Bool?
    var callBack: (() -> Void)?
    
    private let logoImageView = UIImageView().apply {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private let titleLabel = UILabel().apply {
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private let priceLabel = UILabel().apply {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor = .black
    }
    
    private let typeOfProduct = UILabel().apply {
        $0.textColor = .gray
        $0.font = UIFont.boldSystemFont(ofSize: 5)
    }
    
    private let infoStackView = UIStackView().apply {
        $0.axis = .vertical
        $0.distribution = .equalCentering
    }
    
    private let contentStackView = UIStackView().apply {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
    }
    
    private let countLabel = UIButton().apply {
        $0.setTitle("Add", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        $0.contentEdgeInsets = .init(top: 10, left: 20, bottom: 10, right: 20)
    }

    private let addButton = UIButton().apply {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(addAction), for: .touchUpInside)
//        $0.isHidden = true
    }
    
    private let reduceButton = UIButton().apply {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(reduceAction), for: .touchUpInside)
//        $0.isHidden = true
    }
    
    private let buttonStackView = UIStackView().apply {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 10
        $0.distribution = .equalSpacing
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addAction() {
        clickCount += 1
        countLabel.setTitle("\(clickCount)", for: .normal)
        updateModel()
    }
    
    @objc private func reduceAction() {
        if clickCount > 0 {
            clickCount -= 1
            countLabel.setTitle("\(clickCount)", for: .normal)
            addButton.isHidden = false
            reduceButton.isHidden = false
        } else {
            countLabel.setTitle("Add", for: .normal)
            addButton.isHidden = true
            reduceButton.isHidden = true
        }
//        countLabel.text = "\(clickCount)"
        updateModel()
    }
    
    private func updateModel() {
        guard let name = titleLabel.text,
              let img = logoImageView.accessibilityIdentifier,
              let priceString = priceLabel.text,
              let price = Int(priceString) else { return }
        
        let model = MainModel(name: name, img: img, price: priceString, type: .fruits, isLike: isLikeBool ?? false)
        BaseUserDefaults.shared.saveProducts(model: model)
        callBack?()
    }
    
    func configure(model: MainModel, isHidden: Bool = false) {
        logoImageView.image = UIImage(named: model.img)
        logoImageView.accessibilityIdentifier = model.img
        titleLabel.text = model.name
        priceLabel.text = model.price
        typeOfProduct.text = "\(model.type)"
        buttonStackView.isHidden = isHidden
    }
}

private extension MainTableViewCell {
    func setupViews() {
        [titleLabel, priceLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        [logoImageView, infoStackView, UIView(), buttonStackView].forEach {
            contentStackView.addArrangedSubview($0)
        }
        [addButton, countLabel, reduceButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        contentView.addSubview(contentStackView)
    }
    
    func setupConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(20)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(80)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(40)
        }
    }
}

