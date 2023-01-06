//
//  LazyNavigationLink.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct LazyNavigationLink<Destination>: View where Destination: View {
    
    let isActive: Binding<Bool>
    @ViewBuilder let destination: () -> Destination
    
    var body: some View {
        NavigationLink(
            isActive: isActive,
            destination: {
                LazyLoadView(destination())
            },
            label: {
                EmptyView()
            })
    }
}
