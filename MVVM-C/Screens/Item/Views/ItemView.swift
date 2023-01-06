//
//  ItemView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct ItemView: View {
    @ObservedObject var viewModel: ItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.blue.opacity(0.5))
                .frame(height: 400)
            
            Group {
                Text(viewModel.itemDescription)
                Button("item.more", action: viewModel.more)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(viewModel.itemName)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: viewModel.back) {
                    Image(systemName: "chevron.backward")
                }
            })
        }
    }
}
