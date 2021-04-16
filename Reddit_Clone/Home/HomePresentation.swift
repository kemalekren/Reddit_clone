//
//  HomePresentation.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import Foundation

struct HomePresentation {
    private let item: PostData
    
    init(item: PostData) {
        self.item = item
    }
    
    var username: String { return item.data.username }
    var date: String {
        
        if let date = item.data.date {
            return "- " + Date(timeIntervalSince1970: Double(date)).readableDate()
        } else {
            return ""
        }
    }
    var title: String { return item.data.title }
    var description: String { return item.data.description }
    var postTag: String { return item.data.tag }
    var postTagColor: String { return item.data.tagColor }
    var postImage: String? { return item.data.image }
    var rateCount: String { return String(item.data.rateCount) }
    var commentCount: String { return String(item.data.commentCount)}
}
