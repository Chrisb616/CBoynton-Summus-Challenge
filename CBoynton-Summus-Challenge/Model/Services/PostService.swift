//
//  PostService.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation
import Combine

class PostService {
    
    static let Instance = PostService()
    private init() { }
    
    func retrievePosts(completion: @escaping ([Post]) -> ()) {
        ApiClient.Instance.getPosts { posts, errorString in
            if let errorString = errorString {
                print(errorString)
                return;
            }
            
            var postLookup = [Int: Post]()
            
            posts.forEach { post in
                postLookup[post.id] = post
            }
            
            ApiClient.Instance.getComments { comments, errorString in
                if let errorString = errorString {
                    print(errorString)
                    return;
                }
                
                comments.forEach { comment in
                    let post = postLookup[comment.postId]
                    post?.comments.append(comment)
                    postLookup[comment.postId] = post
                }
                
                let result = postLookup.map { return $0.value }.sorted {$0.id < $1.id}
                
                completion(result)
            }
        }
    }
}
