//
//  FeedCoordinator.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class FeedCoordinator: Coordinator {
    
    enum FeedCoordinatorNavigation {
        case feed
        case item
    }
    
    @Published var navigationStack: [(FeedCoordinatorNavigation, Any)] = []
    
    init(feedType: FeedType) {
        let viewModel = FeedViewModel(feedType: feedType)
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .selectItem(let itemId):
                self?.pushItemCoordinator(itemId)
            }
        }
        
        pushToNavigationStack(.feed, viewModel: viewModel)
    }
    
    private func pushItemCoordinator(_ itemId: ItemId) {
        let coordinator = ItemCoordinator(itemId: itemId)
        
        coordinator.onBack = { [weak self] in
            self?.popFromNavigationStack()
        }
        
        pushToNavigationStack(.item, viewModel: coordinator)
    }
}
