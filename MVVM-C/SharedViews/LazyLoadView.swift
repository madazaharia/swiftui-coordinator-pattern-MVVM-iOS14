//
//  LazyLoadView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct LazyLoadView<Content: View>: View {
    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
