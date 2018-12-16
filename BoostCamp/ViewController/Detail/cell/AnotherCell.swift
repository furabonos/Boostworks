//
//  AnotherCell.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class AnotherCell: UICollectionViewCell {

    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var bookPerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        peopleLabel.adjustsFontSizeToFitWidth = true
        gradeLabel.adjustsFontSizeToFitWidth = true
        bookPerLabel.adjustsFontSizeToFitWidth = true
    }

}
