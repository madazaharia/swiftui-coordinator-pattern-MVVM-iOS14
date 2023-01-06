//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class AppCoordinator: Coordinator {
    
    enum AppCoordinatorNavigation {
        case homeFeedCoordinator
        case musicFeedCoordinator
        case accountCoordinator
    }
    
    @Published var navigationStack: [(AppCoordinatorNavigation, Any)] = []
    
    init() {
        pushToNavigationStack(.homeFeedCoordinator, viewModel: FeedCoordinator(feedType: .home))
        pushToNavigationStack(.musicFeedCoordinator, viewModel: FeedCoordinator(feedType: .music))
        pushToNavigationStack(.accountCoordinator, viewModel: AccountCoordinator())
    }
}
