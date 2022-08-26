//
//  PostsViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var userLookup = [Int: User]()
    
    init() {
        refresh()
    }
    
    func refresh() {
        PostService.Instance.retrievePosts { (posts) in
            DispatchQueue.main.async { self.posts = posts }
        }
        UserService.Instance.retrieveUserLookup { (userLookup) in
            DispatchQueue.main.async { self.userLookup = userLookup}
        }
    }
}
