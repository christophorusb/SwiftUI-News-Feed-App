//
//  NewsItemModel.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import Foundation

struct NewsResponseModel: Codable {
    var messages: String
    var total: Int
    var data: [NewsItemModel]
}

struct NewsItemModel: Identifiable, Codable {
    var id: UUID = UUID() // Generating a unique UUID since the provided JSON does not have a specific 'id' field.
    var title: String
    var link: URL
    var contentSnippet: String
    var isoDate: Date
    var image: ImageLinks
    
    enum CodingKeys: String, CodingKey {
        case title, link, contentSnippet, isoDate, image
    }
}

struct ImageLinks: Codable{
    var small: URL
    var large: URL
}


