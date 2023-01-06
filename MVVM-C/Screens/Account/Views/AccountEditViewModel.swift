//
//  AccountEditViewModel.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class AccountEditViewModel: ObservableObject, Navigable {
    
    enum AccountEditNavigation: Equatable {
        case back
        case confirm(name: String, username: String)
    }
    
    @Published var name: String = ""
    @Published var username: String = ""
    
    var onNavigation: ((AccountEditNavigation) -> Void)!
    
    func back() {
        onNavigation(.back)
    }
    
    func confirm() {
        onNavigation(.confirm(name: name, username: username))
    }
}
