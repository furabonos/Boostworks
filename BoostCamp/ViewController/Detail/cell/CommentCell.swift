//
//  CommentCell.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 17..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class CommentCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateLabel.adjustsFontSizeToFitWidth = true
        commentLabel.adjustsFontSizeToFitWidth = true
        idLabel.adjustsFontSizeToFitWidth = true
    }

}
