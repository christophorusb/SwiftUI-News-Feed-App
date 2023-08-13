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
    var categoryFlag: Int {
        return abs(title.hashValue) % 4 + 1
    } // Randomize a number to determine news category
    var timeToRead: Int {
        return abs(title.hashValue) % 8 + 2
    }
    var title: String
    var link: URL
    var contentSnippet: String
    var isoDate: Date
    var image: ImageLinks
    
    enum CodingKeys: String, CodingKey {
        case title, link, contentSnippet, isoDate, image
    }
    
    init() {
            title = "Sample Title"
            link = URL(string: "https://example.com")!
            contentSnippet = "Sample Content Snippet"
            isoDate = Date()
            image = ImageLinks(small: URL(string: "https://akcdn.detik.net.id/visual/2023/08/13/golkar-pan-pkb-dukung-prabowo-di-pilpres-2024-10_169.jpeg?w=360&q=90")!, large: URL(string: "https://akcdn.detik.net.id/visual/2023/08/13/golkar-pan-pkb-dukung-prabowo-di-pilpres-2024-10_169.jpeg?w=360&q=90")!)
    }
}

struct ImageLinks: Codable{
    var small: URL
    var large: URL
}


