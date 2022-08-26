//
//  Album.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class Album: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    
    var photos = [Photo]()
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
    }
}
