//
//  CollectionCell.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var openDateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.adjustsFontSizeToFitWidth = true
        infoLabel.adjustsFontSizeToFitWidth = true
        openDateLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

}
