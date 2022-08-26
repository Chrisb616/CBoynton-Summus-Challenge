//
//  ApiClient.swift
//  CBoynton-Summus-Challenge
//
//  Created by Christopher Boynton on 8/26/22.
//

typealias ErrorString = String

import Foundation
import Combine

class ApiClient {
    
    // MARK: - Instance
    static let Instance = ApiClient()
    private init() {}
    
    // MARK: - Properties
    private let baseUrlString = "https://jsonplaceholder.typicode.com/"
    
    private let postsEndpoint = "posts"
    private let commentsEndpoint = "comments"
    private let usersEndpoint = "users"
    private let albumsEndpoint = "albums"
    private let photosEndpoint = "photos"
    
    // MARK: - GET Methods
    func getPosts(completion: @escaping ([Post], ErrorString?) -> ()) {
        guard let url = URL(string: baseUrlString)?.appendingPathComponent(postsEndpoint) else {
            completion([], "Get Posts Failed: could not create url from path components.")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let unwrappedData = data else {
                completion([], "Get Posts Failed: could not retrieve data from API. \(error?.localizedDescription ?? "No error detected.")")
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: unwrappedData)
                completion(posts, nil)
            }
            catch {
                completion([], "Get Posts Failed: could not deserialize post data. \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getComments(completion: @escaping ([Comment], ErrorString?) -> ()) {
        guard let url = URL(string: baseUrlString)?.appendingPathComponent(commentsEndpoint) else {
            completion([], "Get Comments Failed: could not create url from path components.")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let unwrappedData = data else {
                completion([], "Get Comments Failed: could not retrieve data from API. \(error?.localizedDescription ?? "No error detected.")")
                return
            }
            
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: unwrappedData)
                completion(comments, nil)
            }
            catch {
                completion([], "Get Comments Failed: could not deserialize comment data. \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getUsers(completion: @escaping ([User], ErrorString?) -> ()) {
        guard let url = URL(string: baseUrlString)?.appendingPathComponent(usersEndpoint) else {
            completion([], "Get Users Failed: could not create url from path components.")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let unwrappedData = data else {
                completion([], "Get Users Failed: could not retrieve data from API. \(error?.localizedDescription ?? "No error detected.")")
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: unwrappedData)
                completion(users, nil)
            }
            catch {
                completion([], "Get Users Failed: could not deserialize user data. \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getAlbums(completion: @escaping ([Album], ErrorString?) -> ()) {
        guard let url = URL(string: baseUrlString)?.appendingPathComponent(albumsEndpoint) else {
            completion([], "Get Albums Failed: could not create url from path components.")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let unwrappedData = data else {
                completion([], "Get Albums Failed: could not retrieve data from API. \(error?.localizedDescription ?? "No error detected.")")
                return
            }
            
            do {
                let albums = try JSONDecoder().decode([Album].self, from: unwrappedData)
                completion(albums, nil)
            }
            catch {
                completion([], "Get Albums Failed: could not deserialize user data. \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getPhotos(completion: @escaping ([Photo], ErrorString?) -> ()) {
        guard let url = URL(string: baseUrlString)?.appendingPathComponent(photosEndpoint) else {
            completion([], "Get Photos Failed: could not create url from path components.")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let unwrappedData = data else {
                completion([], "Get Photos Failed: could not retrieve data from API. \(error?.localizedDescription ?? "No error detected.")")
                return
            }
            
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: unwrappedData)
                completion(photos, nil)
            }
            catch {
                completion([], "Get Photos Failed: could not deserialize user data. \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
}
