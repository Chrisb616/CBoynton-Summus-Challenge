//
//  AuthorDetailViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class AuthorDetailViewModel: ObservableObject {
    init (author: User?) {
        self.author = author
    }
    var author: User?
}
