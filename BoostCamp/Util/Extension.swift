//
//  Extension.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(urlString: String) {
        print("Loading image")
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("fail to fetch posts = \(err)")
                return
            }
            
            guard let imageData = data else { return }
            let photoImage = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = photoImage
            }
            }.resume()
    }
}
