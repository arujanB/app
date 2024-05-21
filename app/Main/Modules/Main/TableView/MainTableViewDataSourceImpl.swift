import Foundation
import UIKit

final class MainTableViewDataSourceImpl: NSObject {
    var sections: [MainModelSections]
    
    init(sections: [MainModelSections]) {
        self.sections = sections
    }
}

extension MainTableViewDataSourceImpl: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifire, for: indexPath) as! MainTableViewCell
        switch sections[indexPath.section].rows[indexPath.row] {
        case let .rows(rowModel: model):
            cell.configure(model: model)
        }
        return cell
    }
}
