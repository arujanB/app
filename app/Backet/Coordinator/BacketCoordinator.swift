import Foundation

protocol BacketCoordinatorDelegate: AnyObject {
    
}

final class BacketCoordinator: Coordinator {
    private let moduleFactory = BacketModulFactory()
    private weak var delegate: BacketCoordinatorDelegate?
    
    init(router: Router, delegate: BacketCoordinatorDelegate) {
        self.delegate = delegate
        super.init(router: router)
    }
    
    override func start() {
        setRootVC()
    }
}

extension BacketCoordinator {
    func setRootVC() {
        let vc = moduleFactory.makeRootVC(delegate: self)
        router.setRootModule(vc)
    }
}

// MARK: BacketViewControllerDelegate

extension BacketCoordinator: BacketViewControllerDelegate {
    
}
