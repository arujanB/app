import Foundation

class Coordinator: NSObject {
    public private(set) var childCoordinator: [Coordinator] = []
    public let router: Router
    private weak var parentCoordinator: Coordinator?
    
    init(router: Router) {
        self.router = router
    }
    
    open func start() {}
    
    public func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinator.contains(where: { $0 === coordinator }) else { return }
        coordinator.parentCoordinator = self
        childCoordinator.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator) {
        guard !childCoordinator.isEmpty else { return }
        coordinator.childCoordinator.filter { $0 !== coordinator }.forEach { coordinator.removeDependency($0) }
        childCoordinator.removeAll { $0 === coordinator }
    }
    
    func childCoordinators() {
        childCoordinator.forEach { removeDependency($0) }
    }
}
