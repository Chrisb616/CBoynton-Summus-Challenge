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
            Text(viewModel.post.title).bold()
            Text(viewModel.post.body)
        }
    }
}
