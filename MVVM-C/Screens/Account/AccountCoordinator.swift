//
//  AccountCoordinator.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class AccountCoordinator: Coordinator {
    
    enum AccountCoordinatorNavigation {
        case account      // the screen itself
        case accountEdit  // extra action
        case accountConfirm
        case itemCoordinator
    }
    
    @Published var navigationStack: [(AccountCoordinatorNavigation, Any)] = []
    
    init() {
        let viewModel = AccountViewModel()
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .selectItem(let itemId):
                self?.pushItemCoordinator(itemId)
                
            case .edit:
                self?.pushAccountEditView()
            }
        }
        pushToNavigationStack(.account, viewModel: viewModel)
    }
    
    private func pushAccountEditView() {
        let viewModel = AccountEditViewModel()
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .back:
                self?.popFromNavigationStack()
                
            case let .confirm(name, username):
                self?.pushAccountConfirmView(name: name, username: username)
            }
        }
        
        pushToNavigationStack(.accountEdit, viewModel: viewModel)
    }
    
    private func pushAccountConfirmView(name: String, username: String) {
        let viewModel = AccountConfirmViewModel(name: name, username: username)
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .back:
                self?.popFromNavigationStack()
                
            case .complete:
                // Pop twice (popToRoot)
                self?.popFromNavigationStack()
                self?.popFromNavigationStack()
            }
        }
        
        pushToNavigationStack(.accountConfirm, viewModel: viewModel)
    }
    
    private func pushItemCoordinator(_ itemId: ItemId) {
        let coordinator = ItemCoordinator(itemId: itemId)
        coordinator.onBack = { [weak self] in
            self?.popFromNavigationStack()
        }
        
        pushToNavigationStack(.itemCoordinator, viewModel: coordinator)
    }
}
