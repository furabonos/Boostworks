//
//  MovieInfo.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import Foundation

struct MovieInfo: Decodable {
    var audience: Int
    var actor: String
    var duration: Int
    var director: String
    var synopsis: String
    var genre: String
    var grade: Int
    var image: String
    var reservationGrade: Int
    var title: String
    var reservationRate: Double
    var userRating: Double
    var date: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case audience, actor, duration, director, synopsis, genre, grade, image, title, date, id
        case reservationGrade = "reservation_grade"
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
    }
}
