import Foundation

final class MainModulFactory {
    func makeMain(delegate: MainViewControllerDelegate) -> MainViewController {
        return MainViewController(delegate: delegate)
    }
    
    func makeVC() -> ViewController {
        return ViewController()
    }
}
