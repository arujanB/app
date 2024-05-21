import Foundation
import UIKit

final class TabBarCoordinatorFactory {
    func makeMainVC(delegate: MainCoordinatorDelegate) -> (Coordinator, UIViewController) {
        let navigationController = UINavigationController()
        let coordinator = MainCoordinator(router: .init(navigationController: navigationController), delegate: delegate)
        return (coordinator, navigationController)
    }
    
    func makeBasketVC(delegate: BasketCoordinatorDelegate) -> (Coordinator, UIViewController) {
        let navigationController = UINavigationController()
        let coordinator = BasketCoordinator(router: .init(navigationController: navigationController), delegate: delegate)
        return (coordinator, navigationController)
    }
}
