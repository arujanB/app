import Foundation

class AppCoordinator: Coordinator {
    override func start() {
        let coordinator = TabBarCoordinator(router: router, delegate: self)
        addDependency(coordinator)
        coordinator.start()
    }
}

// MARK: - MainCoordinatorDelegate

extension AppCoordinator: TabBarCoordinatorDelegate {
    func didFinish(_ coordinator: TabBarCoordinator) {
        removeDependency(coordinator)
    }
}
