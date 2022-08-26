//
//  Post.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class Post: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    var comments = [Comment]()
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}
