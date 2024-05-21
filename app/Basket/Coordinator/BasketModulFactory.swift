import Foundation
import UIKit

final class BasketModulFactory {
    func makeRootVC(delegate: BasketViewControllerDelegate) -> UIViewController {
        ViewController(delegate: delegate)
    }
}
