//
//  CountersTableViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 03/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class CountersTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CountersTableViewCell", for: indexPath) as! CountersTableViewCell
    
    
    
    
    
    return cell
  }
  
  
}
