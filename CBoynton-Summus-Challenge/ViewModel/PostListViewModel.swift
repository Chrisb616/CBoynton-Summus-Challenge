//
//  PostsViewModel.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published private var authors = [Int: User]()
    @Published private var comments = [Int: [Comment]]()
    
    func author(forPost post: Post) -> User? {
        return authors[post.userId]
    }
    
    func comments(forPost post: Post) -> [Comment] {
        return comments[post.id] ?? []
    }
    
    init() {
        ApiClient.Instance.getPosts { posts, errorString in
            print(errorString ?? "Posts Loaded")
            DispatchQueue.main.async { self.posts = posts }
        }
        ApiClient.Instance.getUsers { users, errorString in
            print(errorString ?? "Users Loaded")
            DispatchQueue.main.async {
                users.forEach { user in
                    self.authors[user.id] = user
                }
            }
        }
        ApiClient.Instance.getComments { comments, errorString in
            print(errorString ?? "Comments Loaded")
            DispatchQueue.main.async {
                comments.forEach { comment in
                    var commentGroup = self.comments[comment.postId] ?? []
                    commentGroup.append(comment)
                    self.comments[comment.postId] = commentGroup
                }
            }
        }
    }
}
