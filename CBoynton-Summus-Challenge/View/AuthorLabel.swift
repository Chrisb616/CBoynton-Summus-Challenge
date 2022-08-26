//
//  AuthorLabel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct AuthorLabel: View {
    var author: User?
    
    var body: some View {
        HStack {
            Text (author?.name ?? "User Not Found")
            Text (author != nil ? "View author's profile" : "")
        }
    }
}
