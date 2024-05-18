import Foundation

protocol MainCoordinatorDelegate: AnyObject {
    func didFinish(_ coordinator: MainCoordinator)
}

final class MainCoordinator: Coordinator {
    private let moduleFactory = MainModulFactory()
    private weak var delegate: MainCoordinatorDelegate?
    
    init(router: Router, delegate: MainCoordinatorDelegate) {
        self.delegate = delegate
        super.init(router: router)
    }
    
    override func start() {
        makeMain()
    }
}

extension MainCoordinator {
    func makeMain() {
        let vc = moduleFactory.makeMain(delegate: self)
        router.setRootModule(vc)
    }
    
    func makeMainDetail() {
        let vc = moduleFactory.makeMainDetail(delegate: self)
        router.push(vc)
    }
    
}

// MARK: MainViewControllerDelegate

extension MainCoordinator: MainViewControllerDelegate {
    func moveVC() {
        makeMainDetail()
    }
}

// MARK: BacketViewControllerDelegate

extension MainCoordinator: MainDetailViewControllerDelegate {
    
}
