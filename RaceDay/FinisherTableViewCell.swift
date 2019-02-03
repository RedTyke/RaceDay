//
//  FinisherTableViewCell.swift
//  RaceDay
//
//  Created by John McNiffe on 20/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinisherTableViewCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var clubLabel: UILabel!
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var positionLabel: UILabel!
  @IBOutlet weak var clubImage: UIImageView!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}
