//
//  Post.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
