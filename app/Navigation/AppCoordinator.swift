import Foundation

class AppCoordinator: Coordinator {
    override func start() {
        let coordinator = MainCoordinator(router: router, delegate: self)
        addDependency(coordinator)
        coordinator.start()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func didFinish(_ coordinator: MainCoordinator) {
        removeDependency(coordinator)
    }
}
