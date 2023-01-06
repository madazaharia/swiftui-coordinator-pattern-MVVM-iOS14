//
//  AccountConfirmViewModel.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class AccountConfirmViewModel: ObservableObject, Navigable {
    
    enum AccountConfirmNavigation {
        case back
        case complete
    }
    
    let name: String
    let username: String
    var onNavigation: ((AccountConfirmNavigation) -> Void)!
    
    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
    
    func back() {
        onNavigation(.back)
    }
    
    func complete() {
        onNavigation(.complete)
    }
}
