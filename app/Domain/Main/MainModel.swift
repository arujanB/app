import Foundation
import UIKit

struct MainModel: Codable {
    let name: String
    let img: String
    let price: String
    let type: ProductType?
    var isLike: Bool = false
}
