//
//  Comment.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class Comment: Identifiable, Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
