import UIKit
import SnapKit

protocol BasketViewControllerDelegate: AnyObject {
    
}

final class ViewController: UIViewController {
    private weak var delegate: BasketViewControllerDelegate?
    
    private lazy var tableViewdataSourceImpl = BasketTableViewDataSourceImpl()
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped).apply {
        $0.dataSource = tableViewdataSourceImpl
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifire)
    }
    
    private let saveButton = UIButton().apply {
        $0.setTitle("Save", for: .normal)
        $0.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        $0.backgroundColor = .red
    }
    
//    private lazy var categoryCollectionView: UICollectionView = {
//        var layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        
//        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(ProductCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ProductCategoryCollectionViewCell.identifier)
//        collectionView.backgroundColor = .clear
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
    
    init(delegate: BasketViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        setupViews()
        setupConstrints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc private func addAction() {
        print("BASKET VC")
        //alert
    }
}

private extension ViewController {
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(saveButton)
    }
    
    func setupConstrints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
