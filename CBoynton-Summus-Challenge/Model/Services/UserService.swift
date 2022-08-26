//
//  UserService.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

import Foundation

class UserService {
    static let Instance = UserService()
    private init() {}
    
    private var userLookup = [Int: User]()
    
    func retrieveUser(withId id: Int) -> User? {
        return userLookup[id]
    }
    
    func retrieveUserLookup(completion: @escaping ([Int: User]) -> ()) {
        ApiClient.Instance.getUsers { users, errorString in
            if let errorString = errorString {
                print(errorString)
                return;
            }
            
            var userLookup = [Int: User]()
            
            users.forEach { user in
                userLookup[user.id] = user
            }
            
            ApiClient.Instance.getAlbums { albums, errorString in
                if let errorString = errorString {
                    print(errorString)
                    return;
                }
                
                var albumLookup = [Int:Album]()
                
                albums.forEach { album in
                    albumLookup[album.id] = album
                    if let user = userLookup[album.userId] {
                        user.albums.append(album)
                    }
                }
                
                ApiClient.Instance.getPhotos { photos, errorString in
                    if let errorString = errorString {
                        print(errorString)
                        return;
                    }
                    
                    photos.forEach { photo in
                        if let album = albumLookup[photo.albumId] {
                            album.photos.append(photo)
                        }
                    }
                    
                    self.userLookup = userLookup
                    completion(userLookup)
                }
                
            }
            
        }
    }
}
