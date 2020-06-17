//
//  BaseResponse.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
protocol Serializable {
    var id: Int? { get }
}
struct BaseResponse: Codable {
    let status: String?
    let copyright: String?
    let num_results: Int?
    let results: [Results]?
}
struct Results: Codable, Serializable {
    var id: Int?    
    let published_date: String?
    let byline: String?
    let title: String?
    let abstract: String?
    let media: [Media]?
}
struct Media: Codable {
    let type: String?
    let mediaMetadata: [MediaMetadata]?
    enum CodingKeys: String, CodingKey {
        case type
        case mediaMetadata = "media-metadata"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        mediaMetadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
    }
}

struct MediaMetadata: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
