import Foundation
import UIKit

enum MainModelKey: String {
    case model = "mainModelKey"
}

final class BaseUserDefaults {
    static let shared = BaseUserDefaults()
    
    let userDefaults = UserDefaults.standard
    
    var mainModelData: [MainModel]{
        get{
            if let data = userDefaults.value(forKey: MainModelKey.model.rawValue) as? Data{
                return try! PropertyListDecoder().decode([MainModel].self, from: data)
            } else {
                return [MainModel]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefaults.set(data, forKey: MainModelKey.model.rawValue)
            }
        }
    }
    
    func saveProducts(model: MainModel) {
        let data = model
//        let data = MainModel(name: model.name, img: model.img, price: model.price, type: model.type, isLike: model.isLike)
        mainModelData.insert(data, at: 0)
    }
}
