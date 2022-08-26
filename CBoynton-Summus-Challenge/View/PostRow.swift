//
//  PostRow.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct PostRow: View {
    var post: Post
    var author: User?
    
    var body: some View {
        VStack {
            Text(author?.name ?? "User Not Found")
            Text(post.title).bold()
            Text(post.body)
        }
    }
}
