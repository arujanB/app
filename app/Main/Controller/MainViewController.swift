import UIKit
import SnapKit

protocol MainViewControllerDelegate: AnyObject {
    func moveVC()
}

final class MainViewController: UIViewController {
    private weak var delegate: MainViewControllerDelegate?
    
    private let moveButton = UIButton().apply {
        $0.setTitle("move", for: .normal)
        $0.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
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
    }
    
    @objc private func clickMe() {
        print("move")
        delegate?.moveVC()
    }
}

extension MainViewController {
    func setupViews() {
        view.addSubview(moveButton)
    }
    
    func setupConstraints() {
        moveButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
