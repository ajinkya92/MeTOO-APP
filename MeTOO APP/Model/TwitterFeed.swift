//
//  TwitterFeed.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let twitterFeed = try? newJSONDecoder().decode(TwitterFeed.self, from: jsonData)

import Foundation

struct TwitterFeed: Codable {
    let data: [Datum]
    let pages: Pages
}

struct Datum: Codable {
    let screenName, tweetText, createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case screenName = "screen_name"
        case tweetText = "tweet_text"
        case createdAt = "created_at\t"
    }
}

struct Pages: Codable {
    let nextPage: Bool
    let pageNo: Int
    
    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case pageNo = "page_no"
    }
}
