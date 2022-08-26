//
//  PostsViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        ApiClient.Instance.getPosts { posts, errorString in
            print(errorString ?? "Posts Loaded")
            DispatchQueue.main.async { self.posts = posts }
        }
    }
}
