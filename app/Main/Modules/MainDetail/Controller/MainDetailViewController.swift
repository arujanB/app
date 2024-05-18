import UIKit

protocol MainDetailViewControllerDelegate: AnyObject {
    
}

final class MainDetailViewController: UIViewController {
    private weak var delegate: MainDetailViewControllerDelegate?
    
    init(delegate: MainDetailViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }

}
