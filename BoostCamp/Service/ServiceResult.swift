//
//  ServiceResult.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Data?, Error)
}
