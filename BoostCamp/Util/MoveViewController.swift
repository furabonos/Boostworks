//
//  MoveViewController.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

struct MoveStoryboard {
    static func toVC(storybardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storybardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
}
