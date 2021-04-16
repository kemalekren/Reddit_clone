//
//  Posts.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import Foundation

struct PostResponse: Codable {
    let data: Children
    
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct Children: Codable {
    let children: [PostData]
    
    private enum CodingKeys: String, CodingKey {
        case children = "children"
    }
}

struct PostData: Codable {
    let data: Post
    
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct Post: Codable {
    let username: String
    let date: Int?
    let title: String
    let description: String
    let tag: String
    let tagColor: String
    let image: String?
    let rateCount: Int
    let commentCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case username = "author"
        case date = "created_utc"
        case title = "title"
        case description = "selftext"
        case tag = "link_flair_text"
        case tagColor = "link_flair_background_color"
        case image = "thumbnail"
        case rateCount = "score"
        case commentCount = "num_comments"
    }
}


