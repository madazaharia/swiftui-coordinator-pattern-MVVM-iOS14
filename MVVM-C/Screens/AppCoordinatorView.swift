//
//  AppCoordinatorView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: AppCoordinator
    
    // MARK: - Drawing
    var body: some View {
        TabView {
            NavigationView {
                FeedCoordinatorView(coordinator: coordinator.viewModel(for: .homeFeedCoordinator))
            }
            .tabItem {
                Label("app.tab.feed", systemImage: "house")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
                FeedCoordinatorView(coordinator: coordinator.viewModel(for: .musicFeedCoordinator))
            }
            .tabItem {
                Label("app.tab.music", systemImage: "music.note.list")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
                AccountCoordinatorView(coordinator: coordinator.viewModel(for: .accountCoordinator))
            }
            .tabItem {
                Label("app.tab.account", systemImage: "person")
            }
            .navigationViewStyle(.stack)
        }
    }
}
