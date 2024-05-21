import Foundation

enum ProductType {
    case milk
    case vegatable
    case fruits
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
