import Foundation
import UIKit

final class MainTableViewDelegateImpl: NSObject {
    var sections: [MainModelSections]
    var callback: ((MainModel) -> Void)?
    
    init(sections: [MainModelSections]) {
        self.sections = sections
    }
}

extension MainTableViewDelegateImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch sections[indexPath.section].rows[indexPath.row] {
        case let .rows(rowModel: model):
            print("selected \(model.name)")
            callback?(model)
        }
    }
}
