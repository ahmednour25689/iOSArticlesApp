//
//  BaseResponse.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
struct BaseResponse : Codable {
let status : String?
let copyright : String?
let num_results : Int?
let results : [Results]?
}
struct Results : Codable {
let uri : String?
let url : String?
let id : Int?
let asset_id : Int?
let source : String?
let published_date : String?
let updated : String?
let section : String?
let subsection : String?
let nytdsection : String?
let adx_adx_keywordswords : String?
let column : String?
let byline : String?
let type : String?
let title : String?
let abstract : String?
let des_facet : [String]?
let org_facet : [String]?
let per_facet : [String]?
let geo_facet : [String]?
let media : [Media]?
let eta_id : Int?
}
struct Media : Codable {
let type : String?
let mediaMetadata : [MediaMetadata]?
    enum CodingKeys: String, CodingKey {

        case type = "type"
      
        case mediaMetadata = "media-metadata"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)        
        mediaMetadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
    }

}
struct MediaMetadata : Codable {
let url : String?
let format : String?
let height : Int?
let width : Int?
}
