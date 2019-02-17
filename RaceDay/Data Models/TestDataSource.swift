//
//  TestDataSource.swift
//  RaceDay
//
//  Created by John McNiffe on 17/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class TestDataSource: NSObject, UITableViewDataSource {
  
  let cellIdentifier = "CountersTableViewCell"
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CountersTableViewCell
    
    cell.nameLabel.text = "Test"
    
    return cell
  }
}
