//
//  PostRow.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct PostRow: View {
    var viewModel: PostRowViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.author?.name ?? "User Not Found")
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.system(size:12))
                .textCase(.uppercase)
            Text(viewModel.post.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.system(size:18))
            Text(viewModel.post.body).frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.system(size:14))
        }
    }
}
