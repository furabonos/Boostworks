//
//  InfoCell.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class InfoCell: UICollectionViewCell {

    @IBOutlet weak var anotherLabel: UILabel!
    @IBOutlet weak var openDataLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        anotherLabel.adjustsFontSizeToFitWidth = true
        openDataLabel.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontSizeToFitWidth = true
    }

}
