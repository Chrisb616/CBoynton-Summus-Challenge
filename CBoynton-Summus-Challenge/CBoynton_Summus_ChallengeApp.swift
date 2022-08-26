//
//  CBoynton_Summus_ChallengeApp.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/25/22.
//

import SwiftUI

@main
struct CBoynton_Summus_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            PostList(viewModel: PostListViewModel())
        }
    }
}
