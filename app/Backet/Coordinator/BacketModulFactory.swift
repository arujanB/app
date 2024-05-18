import Foundation
import UIKit

final class BacketModulFactory {
    func makeRootVC(delegate: BacketViewControllerDelegate) -> UIViewController {
        ViewController(delegate: delegate)
    }
}
