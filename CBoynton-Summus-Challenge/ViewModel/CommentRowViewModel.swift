//
//  CommentRowViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class CommentRowViewModel: ObservableObject {
    @Published var comment: Comment
    @Published var author: User?
    
    init (comment: Comment) {
        self.comment = comment
        self.author = UserService.Instance.retrieveUser(withId: comment.id)
    }
}
