import UIKit
import SnapKit

class ViewController: UIViewController {

    private let moveButton = UIButton().apply {
        $0.setTitle("move", for: .normal)
        $0.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupViews()
        setupConstrints()
    }
    
    @objc private func clickMe() {
        print("move")
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
