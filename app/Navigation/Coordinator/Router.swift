import UIKit

class Router: NSObject {
    public let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func present(_ viewController: UIViewController, animated: Bool = true) {
        present(viewController, animated: animated)
    }
    
    public func push(_ viewController: UIViewController, animated: Bool = true, hideBottomBarWhenPushed: Bool = true) {
        guard viewController is UINavigationController == false else {
            assertionFailure("Deprecated push UINavigationController")
            return
        }
        viewController.hidesBottomBarWhenPushed = hideBottomBarWhenPushed
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public func setRootModule(_ viewController: UIViewController, isNavigationBarHidden: Bool = false) {
        navigationController.setViewControllers([viewController], animated: false)
        navigationController.isNavigationBarHidden = isNavigationBarHidden
    }
}
