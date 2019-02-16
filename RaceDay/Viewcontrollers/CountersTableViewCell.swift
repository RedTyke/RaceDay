//
//  CountersTableViewCell.swift
//  RaceDay
//
//  Created by John McNiffe on 03/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class CountersTableViewCell: UITableViewCell {
  
  @IBOutlet weak var positionLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var clubLabel: UILabel!
  @IBOutlet weak var ageClassLabel: UILabel!
  @IBOutlet weak var clubImage: UIImageView!
  @IBOutlet weak var pointsLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
