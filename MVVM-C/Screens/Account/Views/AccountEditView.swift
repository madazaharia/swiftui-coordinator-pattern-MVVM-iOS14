//
//  AccountEditView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct AccountEditView: View {
    @ObservedObject var viewModel: AccountEditViewModel
    
    var body: some View {
        Form {
            TextField(LocalizedStringKey("account.edit.name"), text: $viewModel.name)
            TextField(LocalizedStringKey("account.edit.username"), text: $viewModel.username)
        }
        .navigationTitle("account.edit.title")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: viewModel.back) {
                    Image(systemName: "chevron.backward")
                }
            })
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: viewModel.confirm) {
                    Text("account.edit.confirm")
                }
            })
        }
    }
}
