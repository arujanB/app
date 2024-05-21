import Foundation

protocol BasketCoordinatorDelegate: AnyObject {
    
}

final class BasketCoordinator: Coordinator {
    private let moduleFactory = BasketModulFactory()
    private weak var delegate: BasketCoordinatorDelegate?
    
    init(router: Router, delegate: BasketCoordinatorDelegate) {
        self.delegate = delegate
        super.init(router: router)
    }
    
    override func start() {
        setRootVC()
    }
}

extension BasketCoordinator {
    func setRootVC() {
        let vc = moduleFactory.makeRootVC(delegate: self)
        router.setRootModule(vc)
    }
}

// MARK: BacketViewControllerDelegate

extension BasketCoordinator: BasketViewControllerDelegate {
    
}
