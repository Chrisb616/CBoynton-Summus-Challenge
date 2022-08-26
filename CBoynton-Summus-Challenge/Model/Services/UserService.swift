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
            
            self.userLookup = userLookup
            
            completion(userLookup)
        }
    }
}
