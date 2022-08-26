//
//  PostRow.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct PostRow: View {
    var post: Post
    
    var body: some View {
        VStack {
            Text(post.title).bold()
            Text(post.body)
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Preview")
    }
}
