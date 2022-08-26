//
//  PostRowViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class PostRowViewModel: ObservableObject {
    @Published var post: Post
    @Published var author: User?
    
    init (post: Post, author: User?) {
        self.post = post
        self.author = author
    }
    
}
