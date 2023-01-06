//
//  FeedView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct FeedView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: FeedViewModel
    
    private let columns: [GridItem] = [.init(.flexible())]
    
    // MAKR: - Drawing
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.data, id: \.self) { itemId in
                    itemView(for: itemId)
                }
            }
        }
        .navigationTitle("\(viewModel.title)")
    }
    
    func itemView(for itemId: String) -> some View {
        Button {
            viewModel.showItem(itemId)
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Text("🚀")
                    
                    Text(itemId)
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
        }
        .padding(.bottom)
    }
}
