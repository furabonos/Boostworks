//
//  API.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import Foundation

enum API {
    static let baseURL = "http://connect-boxoffice.run.goorm.io"
    
    enum MovieInfo {
        static let defaultURL = baseURL + "/movies?order_type=0"
        static let curationURL = baseURL + "/movies?order_type=1"
        static let openDateURL = baseURL + "/movies?order_type=2"
    }
    
    enum MovieDetail {
       static let detailURL = baseURL + "/movie?id="
    }
    
    enum Replys {
        static let replyURL = baseURL + "/comments?movie_id="
    }
}
