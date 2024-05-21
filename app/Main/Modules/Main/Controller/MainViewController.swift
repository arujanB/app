import UIKit
import SnapKit

protocol MainViewControllerDelegate: AnyObject {
    func moveVC(model: MainModel)
}

final class MainViewController: UIViewController {
    private weak var delegate: MainViewControllerDelegate?
    private lazy var tableViewdataSourceImpl = MainTableViewDataSourceImpl(sections: storeViewModel.storeData)
    private lazy var tableViewdelegateImpl = MainTableViewDelegateImpl(sections: storeViewModel.storeData)
    private let storeViewModel: ViewModel = ViewModel()
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped).apply {
        $0.dataSource = tableViewdataSourceImpl
        $0.delegate = tableViewdelegateImpl
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifire)
//        $0.showsVerticalScrollIndicator = false
//        $0.separatorStyle = .none
    }
    
    init(delegate: MainViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
        setupConstraints()
        navigationController?.navigationBar.backgroundColor = .orange
        tableViewdelegateImpl.callback = { [weak self] model in
            print("delegate move")
            self?.delegate?.moveVC(model: model)
        }
    }
}

extension MainViewController {
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
