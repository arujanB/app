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
            callback?(model)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myContentView = UIView()
        let titleLabel = UILabel().apply {
            $0.text = sections[section].sections.title
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
        
        myContentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.verticalEdges.equalToSuperview().inset(10)
        }
        
        return myContentView
    }
}
