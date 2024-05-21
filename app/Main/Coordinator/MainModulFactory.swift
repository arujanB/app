import Foundation

final class MainModulFactory {
    func makeMain(delegate: MainViewControllerDelegate) -> MainViewController {
        return MainViewController(delegate: delegate)
    }
    
    func makeMainDetail(delegate: MainDetailViewControllerDelegate, mainModel: MainModel) -> MainDetailViewController {
        return MainDetailViewController(delegate: delegate, model: mainModel)
    }
}
