//
//  MockData.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([.init(name: "", image: "burger"),
                .init(name: "", image: "pizza"),
                .init(name: "", image: "wok")])
    }()
    
    private let category: ListSection = {
        .categories([.init(name: "Chicken", image: "pizza"),
                .init(name: "Burger", image: "burger"),
                .init(name: "Wok", image: "wok"),
                .init(name: "Margaritta", image: "pizza"),])
    }()
    
    private let example: ListSection = {
        .example([.init(name: "", image: "pizza"),
                .init(name: "", image: "burger"),
                .init(name: "", image: "wok"),
                .init(name: "", image: "pizza"),
                .init(name: "", image: "burger"),])
    }()
    
    var pageData: [ListSection] {
        [sales, category, example]
    }
    
}
