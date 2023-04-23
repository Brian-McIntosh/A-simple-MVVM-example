//
//  ItemModel.swift
//  MVVM1
//
//  Created by Brian McIntosh on 4/22/23.
//

import Foundation

// Step 1
struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    
    // it's always good to have an example of your model/sample data for Preview purposes
    static var exampleItem = Item(name: "Xbox", description: "Sample description")
}
