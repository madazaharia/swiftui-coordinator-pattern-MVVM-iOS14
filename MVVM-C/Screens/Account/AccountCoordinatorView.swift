//
//  AccountCoordinatorView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct AccountCoordinatorView: View {
    @ObservedObject var coordinator: AccountCoordinator
    
    var body: some View {
        ZStack {
            AccountView(viewModel: coordinator.viewModel(for: .account))
            
            LazyNavigationLink(
                isActive: coordinator.isActive(.accountEdit),
                destination: {
                    AccountEditView(viewModel: coordinator.viewModel(for: .accountEdit))

                    LazyNavigationLink(
                        isActive: coordinator.isActive(.accountConfirm),
                        destination: {
                            AccountConfirmView(viewModel: coordinator.viewModel(for: .accountConfirm))
                        })
                })
            
            LazyNavigationLink(
                isActive: coordinator.isActive(.itemCoordinator),
                destination: {
                    ItemCoordinatorView(coordinator: coordinator.viewModel(for: .itemCoordinator))
                })
        }
    }
}
