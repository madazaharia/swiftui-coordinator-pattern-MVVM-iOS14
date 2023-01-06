//
//  MVVM_CApp.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

@main
struct MVVM_CApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: AppCoordinator())
        }
    }
}
