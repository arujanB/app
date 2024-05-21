import UIKit

final class BasketTableViewDataSourceImpl: NSObject {

}

extension BasketTableViewDataSourceImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BaseUserDefaults.shared.mainModelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifire, for: indexPath) as! MainTableViewCell
        cell.configure(model: BaseUserDefaults.shared.mainModelData[indexPath.row], isHidden: true)
        return cell
    }
}
