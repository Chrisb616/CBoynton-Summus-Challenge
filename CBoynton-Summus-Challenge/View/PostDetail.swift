//
//  PostDetail.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct PostDetail: View {
    @StateObject var viewModel: PostDetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.post.title)
            Text(viewModel.post.body)
            NavigationLink {
                AuthorDetail(viewModel: AuthorDetailViewModel(author: viewModel.author))
            } label: {
                AuthorLabel(author: viewModel.author)
            }
            List(viewModel.comments) { comment in
                Text(comment.body)
            }
        }
    }
}
