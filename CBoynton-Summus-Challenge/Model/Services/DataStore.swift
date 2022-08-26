//
//  DataStore.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class DataStore {
    
    // MARK: - Instance
    static let Instance = DataStore()
    private init() {
    }
    
    var albums = [Album]()
    var commentsLookup = [Int:[Comment]]()
    var photos = [Photo]()
    var usersLookup = [Int: User]()
    
    func retrieveAllData(completion: @escaping ()->()) {
        ApiClient.Instance.getAlbums { albums, errorString in
            print(errorString ?? "Albums retrieval successful")
            
            self.albums = albums
            
            ApiClient.Instance.getComments { comments, errorString in
                print(errorString ?? "Comments retrieval successful")
                
                comments.forEach { comment in
                    var commentGroup = self.commentsLookup[comment.id] ?? []
                    commentGroup.append(comment)
                    self.commentsLookup[comment.id] = commentGroup
                }
                
                ApiClient.Instance.getPhotos { photos, errorString in
                    print(errorString ?? "Photos retrieval successful")
                    
                    self.photos = photos
                    
                    ApiClient.Instance.getUsers { users, errorString in
                        print(errorString ?? "Users retrieval successful")
                        
                        users.forEach { user in
                            self.usersLookup[user.id] = user
                        }
                        
                        completion();
                    }
                }
            }
        }
    }
    
}
