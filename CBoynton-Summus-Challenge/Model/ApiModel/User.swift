//
//  User.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class User: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
}
