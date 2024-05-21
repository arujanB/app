import Foundation

enum ProductType: Codable {
    case milk
    case vegatable
    case fruits
    
    var title: String {
        switch self {
        case .fruits:
            "fruits"
        case .milk:
            "milk"
        case .vegatable:
            "vegatable"
        }
    }
}

//enum MainSection {
//    case section(type: ProductType)
//}

enum MainRow {
    case rows(rowModel: MainModel)
}

struct MainModelSections {
    let sections: /*MainSection*/ProductType
    var rows: [MainRow]
}
