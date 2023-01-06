//
//  Navigable.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

protocol Navigable {
    associatedtype NavigationItem: Equatable /// making protocols generic
    
    var onNavigation: ((NavigationItem) -> Void)! { get }
}
