import UIKit

struct TabBarItem {
    let title: String
    let logo: UIImage
    let vc: UIViewController
}

class TabBarViewContoller: UITabBarController {
    let items: [TabBarItem]
    
    init(items: [TabBarItem]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarItems()
        view.backgroundColor = .yellow
    }
    
    func configureTabBarItems() {
        let vcList = items.enumerated().map { index, item in
            let controller = item.vc
            controller.tabBarItem = UITabBarItem(title: item.title, image: item.logo, tag: index)
            return controller
        }
        
        viewControllers = vcList
        tabBar.backgroundColor = .white
        tabBar.itemPositioning = .centered
    }
}
