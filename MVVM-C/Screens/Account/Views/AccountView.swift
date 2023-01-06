//
//  AccountView.swift
//  MVVM-C
//
//  Created by Madalin Zaharia on 06.01.2023.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: AccountViewModel
    
    var body: some View {
        Form {
            Section(content: {
                HStack(spacing: 16) {
                    Image("profile-icon")
                        .frame(width: 64, height: 64)
                        .padding(.bottom, 12)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.name)
                            .font(.headline)
                        
                        Text(viewModel.username)
                            .font(.subheadline)
                        
                        Button {
                            viewModel.edit()
                        } label: {
                            Text("Edit")
                        }
                    }
                }
            }, header: {
                Text("account.header.default")
            })
            
            Section(content: {
                Button(action: {
                    viewModel.selectItem("Item One")
                }, label: {
                    Text("Item One")
                })
                
                Button(action: {
                    viewModel.selectItem("Item Two")
                }, label: {
                    Text("Item Two")
                })
            }, header: {
                Text("account.header.favorites")
            })
        }
        .navigationBarHidden(true)
    }
}
