//
//  ItemViewModel.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class ItemViewModel: ObservableObject, Navigable {
    
    enum ItemNavigation {
        case back
        case more
    }
    
    let itemName: String
    let itemDescription = "Simple iOS app to showcase the use of the Coordinator pattern using SwiftUI and MVVM."
    
    var onNavigation: ((ItemNavigation) -> Void)!
    
    init(itemId: ItemId) {
        itemName = itemId
    }
    
    func back() {
        onNavigation(.back)
    }
    
    func more() {
        onNavigation(.more)
    }
}
