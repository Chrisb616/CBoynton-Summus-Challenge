//
//  AuthorDetail.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct AuthorDetail: View {
    var viewModel: AuthorDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Username:").bold()
                    Text(viewModel.author.username)
                }
                HStack {
                    Text("Real Name:").bold()
                    Text(viewModel.author.name)
                }
                HStack {
                    Text("Email:").bold()
                    Text(viewModel.author.email)
                }
                HStack {
                    Text("Phone:").bold()
                    Text(viewModel.author.phone)
                }
                HStack {
                    Text("Website:").bold()
                    Text(viewModel.author.website)
                }
                
            }
            LazyVGrid (columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                
            }
        }
    }
}
