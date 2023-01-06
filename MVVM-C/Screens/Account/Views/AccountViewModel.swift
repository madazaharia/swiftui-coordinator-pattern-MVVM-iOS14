//
//  AccountViewModel.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Combine

final class AccountViewModel: ObservableObject, Navigable {
    
    enum AccountNavigation: Equatable {
        case selectItem(ItemId)
        case edit
    }
    
    let name: String = "Name"
    let username: String = "@name"
    
    var onNavigation: ((AccountNavigation) -> Void)!
    
    func selectItem(_ itemId: ItemId) {
        onNavigation(.selectItem(itemId))
    }
    
    func edit() {
        onNavigation(.edit)
    }
}
