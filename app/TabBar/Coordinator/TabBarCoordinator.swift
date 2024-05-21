import Foundation
import UIKit

protocol TabBarCoordinatorDelegate: AnyObject {
    func didFinish(_ coordinator: TabBarCoordinator)
}

class TabBarCoordinator: Coordinator {
    private weak var delegate: TabBarCoordinatorDelegate?
    private let coordinatorFactory = TabBarCoordinatorFactory()
    var itemsArray: [TabBarItem] = []
    
    init(router: Router, delegate: TabBarCoordinatorDelegate) {
        self.delegate = delegate
        super.init(router: router)
    }
    
    override func start() {
        setRootVC()
    }
}

extension TabBarCoordinator {
    func setRootVC() {
        let mainVC = coordinatorFactory.makeMainVC(delegate: self)
        let basketVC = coordinatorFactory.makeBasketVC(delegate: self)
        
        itemsArray = [
            .init(title: "Main", logo: UIImage(systemName: "circle") ?? UIImage(), vc: mainVC.1),
            .init(title: "Basket", logo: UIImage(systemName: "basket") ?? UIImage(), vc: basketVC.1)
        ]
        
        addDependency(mainVC.0)
        mainVC.0.start()
        
        addDependency(basketVC.0)
        basketVC.0.start()
        
        let vc = TabBarViewContoller(items: itemsArray)
        router.setRootModule(vc)
    }
}

// MARK: - MainCoordinatorDelegate

extension TabBarCoordinator: MainCoordinatorDelegate {
    func didFinish(_ coordinator: MainCoordinator) {
        print("didfinish mainCoordinator delagte in tabbar")
        removeDependency(coordinator)
    }
}

// MARK: - BacketCoordinatorDelegate

extension TabBarCoordinator: BasketCoordinatorDelegate {
    
}
