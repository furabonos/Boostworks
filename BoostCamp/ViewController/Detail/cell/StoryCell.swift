//
//  StoryCell.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {

    @IBOutlet weak var storyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyLabel.adjustsFontSizeToFitWidth = true
    }

}
