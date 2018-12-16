////
////  MovieService.swift
////  BoostCamp
////
////  Created by 엄태형 on 2018. 12. 16..
////  Copyright © 2018년 엄태형. All rights reserved.
////
//
//import Foundation
//
//
//protocol MovieServiceType {
//    func searchMovieInfo(pk: Int, completion: @escaping (Result<[Movie]>) -> ())
//}
//
//struct MovieService: MovieServiceType {
//    func searchMovieInfo(pk: Int, completion: @escaping (Result<[Movie]>) -> ()) {
//
//        var api = "http://connect-boxoffice.run.goorm.io/movies?order_type=1"
//        
//        guard let apiURL = URL(string: api) else { return }
//
//        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
//
//            guard let data = data else { return }
//
//            do {
//                let decodableValue = try JSONDecoder().decode([Movie].self, from: data)
////                print("ss = \(decodableValue as! [String: Any])")
//                print(decodableValue.count)
////                completion(Result.success(decodableValue))
//            } catch {
//                print("failed to fetch movie info : \(error)")
//            }
//        }
//        task.resume()
//
//    }
//}
//
