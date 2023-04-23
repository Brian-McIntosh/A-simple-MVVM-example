//
//  ContentViewModel.swift
//  MVVM1
//
//  Created by Brian McIntosh on 4/22/23.
//

import Foundation
import SwiftUI

extension ContentView {
    
    // Step 2
    // @MainActor = always on main thread
    @MainActor class ViewModel: ObservableObject {
        
        @Published var isTurnedOn: Bool = false
        @Published var counter = 0
        @Published var itemList = [Item]()
        
        func increment() {
            counter += 1
        }
        
        func addItem() {
            let randomItems = ["Playstation", "Xbox", "Nintendo Wii", "Gameboy"]
            let item = randomItems.randomElement()!
            
            let newItem = Item(name: item, description: "Item: \(itemList.count + 1)")
            
            //1st thought...
            //itemList.append(newItem)
            
            withAnimation {
                itemList.insert(newItem, at: 0) // <-- 2nd new
            }
        }
    }
    
}
