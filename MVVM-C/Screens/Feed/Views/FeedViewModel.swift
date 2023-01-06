//
//  FeedViewModel.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import Foundation

final class FeedViewModel: ObservableObject, Navigable {
    
    enum FeedNavigation: Equatable { // actions
        case selectItem(ItemId)
    }
    
    lazy var data: [String] = {
        switch feedType {
        case .home:
            return [
                "Item One",
                "Item Two",
                "Item Three",
                "Item Four",
                "Item Five"
            ]
        case .music:
            return [
                "Track One",
                "Track Two",
                "Track Three"
            ]
        }
    }()
    
    var title: String {
        return feedType.rawValue
    }
    
    var onNavigation: ((FeedNavigation) -> Void)!
    
    private let feedType: FeedType
    
    init(feedType: FeedType) {
        self.feedType = feedType
    }
    
    func showItem(_ itemId: ItemId) {
        onNavigation(.selectItem(itemId))
    }
}
