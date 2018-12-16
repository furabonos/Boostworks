//
//  TableCell.swift
//  BoostCamp
//
//  Created by 엄태형 on 2018. 12. 16..
//  Copyright © 2018년 엄태형. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var openDateLabel: UILabel!
    @IBOutlet weak var bookPerLabel: UILabel!
    @IBOutlet weak var bookGradeLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
