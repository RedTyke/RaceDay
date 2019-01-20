//
//  FinisherTableViewCell.swift
//  RaceDay
//
//  Created by John McNiffe on 20/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinisherTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpLayout() {

        self.addSubview(nameLabel)
    }
    
}
