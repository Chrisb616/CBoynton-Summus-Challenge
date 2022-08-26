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
                .bold()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.system(size:16))
                .padding(5)
            Text(viewModel.post.body).frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.system(size:14))
                .padding(5)
            NavigationLink {
                if let author = viewModel.author {
                    AuthorDetail(viewModel: AuthorDetailViewModel(author: author))
                }
            } label: {
                AuthorLabel(author: viewModel.author)
            }
            List(viewModel.post.comments) { comment in
                CommentRow(viewModel: CommentRowViewModel(comment: comment))
            }
        }
        .navigationTitle("Post #\(viewModel.post.id)")
    }
}
