import UIKit

protocol MainDetailViewControllerDelegate: AnyObject {
    
}

final class MainDetailViewController: UIViewController {
    private weak var delegate: MainDetailViewControllerDelegate?
    private let model: MainModel
    
    private lazy var navigationTitle = UILabel().apply {
        $0.textColor = .red
        $0.text = model.name
    }
    init(delegate: MainDetailViewControllerDelegate, model: MainModel) {
        self.delegate = delegate
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        appearance.shadowImage = UIImage()
        appearance.shadowColor = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navigationTitle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupViews()
        setupConstraints()
    }
}

extension MainDetailViewController {
    func setupViews() {
        view.addSubview(navigationTitle)
    }
    
    func setupConstraints() {
        navigationTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
