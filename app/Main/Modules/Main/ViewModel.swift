import Foundation
import UIKit

struct ViewModel {
    var mainData: [MainModel] = [
        .init(name: "Banana", img: UIImage(systemName: "home") ?? UIImage(), price: 200, type: .fruits, isLike: false),
        .init(name: "Apple", img: UIImage(systemName: "home") ?? UIImage(), price: 300, type: .fruits, isLike: false),
        .init(name: "Avacado", img: UIImage(systemName: "home") ?? UIImage(), price: 1500, type: .vegatable, isLike: false),
        .init(name: "Cucumber", img: UIImage(systemName: "home") ?? UIImage(), price: 150, type: .vegatable, isLike: false),
        .init(name: "Tomato", img: UIImage(systemName: "home") ?? UIImage(), price: 1300, type: .vegatable, isLike: false),
        .init(name: "Milk", img: UIImage(systemName: "home") ?? UIImage(), price: 465, type: .milk, isLike: false),
    ]
    
    var storeData: [MainModelSections] = [
        .init(sections: .fruits, rows: [
            .rows(rowModel: .init(name: "Banana", img: UIImage(systemName: "home") ?? UIImage(), price: 200, type: .fruits, isLike: false)),
            .rows(rowModel: .init(name: "Apple", img: UIImage(systemName: "home") ?? UIImage(), price: 300, type: .fruits, isLike: false))
        ]),
        .init(sections: .vegatable, rows: [
            .rows(rowModel: .init(name: "Avacado", img: UIImage(systemName: "home") ?? UIImage(), price: 1500, type: .vegatable, isLike: false)),
            .rows(rowModel: .init(name: "Cucumber", img: UIImage(systemName: "home") ?? UIImage(), price: 150, type: .vegatable, isLike: false)),
            .rows(rowModel: .init(name: "Tomato", img: UIImage(systemName: "home") ?? UIImage(), price: 1300, type: .vegatable, isLike: false))
        ]),
        .init(sections: .milk, rows: [
            .rows(rowModel: .init(name: "Milk", img: UIImage(systemName: "home") ?? UIImage(), price: 465, type: .milk, isLike: false))
        ])
    ]
}
