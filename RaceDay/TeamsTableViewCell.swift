//
//  TeamsTableViewCell.swift
//  RaceDay
//
//  Created by John McNiffe on 02/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

  @IBOutlet weak var positionLabel: UILabel!
  @IBOutlet weak var clubNameLabel: UILabel!
  @IBOutlet weak var pointsLabel: UILabel!
  @IBOutlet weak var clubImage: UIImageView!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }

}
