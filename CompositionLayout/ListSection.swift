//
//  SectionItem.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import Foundation

enum ListSection {
    case sales([ListItem])
    case categories([ListItem])
    case example([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items),
                .categories(let items),
                .example(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return ""
        case .categories(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
