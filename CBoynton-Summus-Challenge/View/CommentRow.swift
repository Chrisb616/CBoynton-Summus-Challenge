//
//  CommentRow.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import SwiftUI

struct CommentRow: View {
    @StateObject var viewModel: CommentRowViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.comment.name)
            Text(viewModel.author?.email ?? "User Not Found")
            Text(viewModel.comment.body)
        }
    }
}
