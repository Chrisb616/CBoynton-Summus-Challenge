//
//  PostDetailViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class PostDetailViewModel: ObservableObject {
    var post: Post
    var author: User?
    var comments: [Comment]
    
    init (post: Post, author: User?, comments: [Comment]) {
        self.post = post
        self.author = author
        self.comments = comments
    }
}
