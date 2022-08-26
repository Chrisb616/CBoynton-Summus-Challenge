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
                
                PostDetail()

                } label: {
                    PostRow(post: post)
                }
                .navigationTitle("CBoynton Takehome")
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList(viewModel: PostListViewModel())
    }
}
