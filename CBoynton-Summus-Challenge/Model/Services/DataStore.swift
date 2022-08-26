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
    private init() {}
    
    var albums = [Album]()
    var comments = [Comment]()
    var photos = [Photo]()
    var users = [User]()
    
    func retrieveAllData(completion: @escaping ()->()) {
        ApiClient.Instance.getAlbums { albums, errorString in
            print(errorString ?? "Albums retrieval successful")
            
            self.albums = albums
            
            ApiClient.Instance.getComments { comments, errorString in
                print(errorString ?? "Comments retrieval successful")
                
                self.comments = comments
                
                ApiClient.Instance.getPhotos { photos, errorString in
                    print(errorString ?? "Photos retrieval successful")
                    
                    self.photos = photos
                    
                    ApiClient.Instance.getUsers { users, errorString in
                        print(errorString ?? "Users retrieval successful")
                        
                        self.users = users
                        
                        completion();
                    }
                }
            }
        }
    }
    
}
