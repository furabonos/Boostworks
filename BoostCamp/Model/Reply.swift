//
//  Reply.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import Foundation

struct Reply: Decodable {
    var movieId: String
    var comments: [comments]
    
    enum CodingKeys: String, CodingKey {
        case comments
        case movieId = "movie_id"
    }
}

struct comments: Decodable {
    var rating: Double
    var timestamp: Double
    var writer: String
    var movieId: String
    var contents: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case rating, timestamp, writer, contents, id
        case movieId = "movie_id"
    }
}
