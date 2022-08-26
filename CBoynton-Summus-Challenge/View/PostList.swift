//
//  PostList.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct PostList: View {
    @StateObject var viewModel: PostListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink {
                    PostDetail(
                        viewModel: PostDetailViewModel(
                            post: post,
                            author: viewModel.author(forPost: post),
                            comments: viewModel.comments(forPost: post)
                        )
                    )
                } label: {
                    PostRow(post: post, author: viewModel.author(forPost: post))
                }
                .navigationTitle("CBoynton Takehome")
            }
        }
    }
}
