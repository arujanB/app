import UIKit
import SnapKit

protocol BacketViewControllerDelegate: AnyObject {
    
}

final class ViewController: UIViewController {
    private weak var delegate: BacketViewControllerDelegate?

    private let moveButton = UIButton().apply {
        $0.setTitle("backet", for: .normal)
        $0.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
    }
    
    init(delegate: BacketViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupViews()
        setupConstrints()
    }
    
    @objc private func clickMe() {
        print("BACKET VC")
    }
}

extension ViewController {
    func setupViews() {
        view.addSubview(moveButton)
    }
    
    func setupConstrints() {
        moveButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
