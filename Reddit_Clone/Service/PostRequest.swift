//
//  PostRequest.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}


class PostRequest {
    
    func fetchPost(completion: @escaping(Result<[PostData], NetworkError>) -> ()) {
        
        guard let url = URL(string: baseURL) else {
            return completion(.failure(.badURL))
        }
        

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil  else {
                return completion(.failure(.noData))
            }
            
            do {
                let postResponse = try JSONDecoder().decode(PostResponse.self, from: data)
                completion(.success(postResponse.data.children))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
