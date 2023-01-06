//
//  ItemCoordinator.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class ItemCoordinator: Coordinator {
    
    enum ItemCoordinatorNavigation { // actions
        case item
        case details
    }
    
    @Published var navigationStack: [(ItemCoordinatorNavigation, Any)] = []
    
    var onBack: (() -> Void)!
    
    init(itemId: ItemId) {
        let viewModel = ItemViewModel(itemId: itemId)
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .back:
                self?.onBack()
                
            case .more:
                self?.pushItemDetails()
            }
        }
        
        pushToNavigationStack(.item, viewModel: viewModel)
    }
    
    func popItemDetails() {
        popFromNavigationStack()
    }
    
    private func pushItemDetails() {
        let viewModel = ItemDetailsViewModel()
        pushToNavigationStack(.details, viewModel: viewModel)
    }
}
