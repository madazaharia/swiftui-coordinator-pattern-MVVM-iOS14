//
//  ItemDetailsView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct ItemDetailsView: View {
    @ObservedObject var viewModel: ItemDetailsViewModel
    
    var body: some View {
        Text(viewModel.details)
    }
}
